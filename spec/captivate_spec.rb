require 'spec_helper'

describe  Captivate::Command do
  before do
    Captivate::Config.stub!(:new).and_return('host' => 'the_host', 'working_path' => 'the_path')
    @remote_dir = mock('remote_dir')
    @remote_dir.stub!(:upload)
    @remote_subdir = mock('subdir')
    @remote_subdir.stub!(:upload)
    @remote_dir.stub!(:new_subdir).and_return(@remote_subdir)
    Captivate::RemoteDir.stub!(:new).and_return(@remote_dir)
    Captivate::SystemCall.stub!(:new)
    @remote_script = mock('remote_script')
    @remote_script.stub!(:local_path)
    Captivate::RemoteScript.stub!(:new).and_return(@remote_script)
    @command = Captivate::Command.new(['some cap commands'])
    File.stub!(:chmod)
  end
  
  it "should pass rails_root and command to config" do
    FileUtils.stub!(:pwd).and_return('path_to_my_app')
    Captivate::Config.should_receive(:new).with(:command => 'some cap commands', :rails_root => 'path_to_my_app')
    @command.invoke
  end
  
  it "should create a remote working directory" do
    Captivate::Config.should_receive(:new).and_return('host' => 'the_host', 'working_path' => 'the_path')
    Captivate::RemoteDir.should_receive(:new).with(:host => 'the_host', :path => 'the_path').and_return(@remote_dir)
    @command.invoke
  end
  
  it "should upload Capfile" do
    @remote_dir.should_receive(:upload).with('Capfile')
    @command.invoke
  end
  
  it "should create a config subdirectory" do
    @remote_dir.should_receive(:new_subdir).with('config')
    @command.invoke
  end
  
  it "should upload deploy.rb to config" do
    @remote_subdir.should_receive(:upload).with('config/deploy.rb')
    @command.invoke
  end
  
  it "shouldn't upload config/deploy if doesn't exist" do
    File.should_receive(:directory?).with('config/deploy').and_return(false)
    @remote_subdir.should_not_receive(:upload).with('config/deploy')
    @command.invoke
  end
  
  it "should upload config/deploy if exists" do
    File.should_receive(:directory?).with('config/deploy').and_return(true)
    @remote_subdir.should_receive(:upload).with('config/deploy')
    @command.invoke
  end
  
  it "should write remote script locally" do
    Captivate::RemoteScript.should_receive(:new).with(:command => 'some cap commands', :remote_path => 'the_path')
    @command.invoke
  end
  
  it "should upload remote script" do
    @remote_script.should_receive(:local_path).and_return('path_to_local_script')
    @remote_dir.should_receive(:upload).with('path_to_local_script', 'captivate-remote.sh')
    @command.invoke
  end
  
  it "should invoke remote script" do
    Captivate::SystemCall.should_receive(:new).with(%{ssh -t the_host screen the_path/captivate-remote.sh})
    @command.invoke
  end
  
  it "should make remote script executable" do
    @remote_script.should_receive(:local_path).and_return('some_path')
    File.should_receive(:chmod).with(0555, 'some_path')
    @command.invoke
  end
end

describe Captivate::Config do
  before do
    @rails_root       = 'path/to/my_app'
    @config           = Captivate::Config.new(:command => 'some cap commands', :rails_root => @rails_root)
    @yaml_config_path = 'path/to/my_app/config/captivate.yml'
  end
  
  it "should raise an error when 'command' not passed in" do
    lambda do
      Captivate::Config.new(:rails_root => 'the_path').invoke.should
    end.should raise_error(Captivate::ConfigError, "Missing 'command' option")
  end

  it "should raise an error when 'rails_root' not passed in" do
    lambda do
      Captivate::Config.new(:command => 'the_command').invoke.should
    end.should raise_error(Captivate::ConfigError, "Missing 'rails_root' option")
  end
  
  context 'without YAML' do
    it "should raise error" do
      lambda { @config.to_hash }.should raise_error(Captivate::ConfigError, @yaml_config_path)
    end
  end
  
  context 'with YAML' do
    before do
      File.should_receive(:exists?).with(@yaml_config_path).and_return(true)
      @multistage_config = {
        'production' => {'host' => 'the_host'},
        'staging'    => {'host' => 'another_host'},
      }
      YAML.stub!(:load_file).with(@yaml_config_path).and_return(@multistage_config)
    end

    it "should return a hash" do
      @config.to_hash.should be_a(Hash)
    end
    
    it "should retrieve host from YAML config, defaulting to production" do
      @config.to_hash['host'].should == 'the_host'
    end
    
    it "should not accept non-production stages if multistage gem not present" do
      @config = Captivate::Config.new(:command => 'staging some cap commands', :rails_root => @rails_root)
      @config.stub!(:deploy_file_contents).and_return('deploy_config')
      @config.to_hash['host'].should == 'the_host'
    end
    
    it "should raise error if multistage gem present but stages not found" do
      @config = Captivate::Config.new(:command => 'staging some cap commands', :rails_root => @rails_root)
      @config.stub!(:deploy_file_contents).and_return(<<-EOS)
      require 'capistrano/ext/multistage'
      some cap commands
      EOS
      lambda { @config.to_hash }.should raise_error(Captivate::ConfigError, "'set :stages' definition not found")
    end

    it "should detect valid stage as first parameter if valid stage and multistage gem present" do
      @config = Captivate::Config.new(:command => 'staging some cap commands', :rails_root => @rails_root)
      @config.stub!(:deploy_file_contents).and_return(<<-EOS)
      require 'capistrano/ext/multistage'
      set :stages, %w(production staging showcase)
      some cap commands
      EOS
      @config.to_hash['host'].should == 'another_host'
    end

    it "should detect valid stage as first parameter if valid stage and multistage gem present but commented out" do
      @config = Captivate::Config.new(:command => 'staging some cap commands', :rails_root => @rails_root)
      @config.stub!(:deploy_file_contents).and_return(<<-EOS)
      # require 'capistrano/ext/multistage'
      some cap commands
      EOS
      @config.to_hash['host'].should == 'the_host'
    end

    # Not defined in YAML config (@multistage_config['showcase'])
    it "should ignore invalid stage as first parameter" do
      @config = Captivate::Config.new(:command => 'showcase some cap commands', :rails_root => @rails_root)
      @config.to_hash['host'].should == 'the_host'
    end
  
    it "should contain timestamp, app_name, environment, user in remote working directory name" do
      Etc.stub!(:getlogin).and_return('the_user')
      @config.to_hash['working_path'].should == "/tmp/captivate.#{Time.now.to_i}.my_app.production.the_user"
    end
  
    it "should merge YAML config" do
      @config.stub!(:yaml_config).and_return('production' => {'host' => 'the_host', 'working_path' => 'custom_path'})
      @config.to_hash['working_path'].should == 'custom_path'
    end
  
    it "should raise an error if missing config for environment" do
      YAML.stub!(:load_file).with(@yaml_config_path).and_return({})
      lambda do
        @config.to_hash
      end.should raise_error(Captivate::ConfigError, 'Missing production environment')
    end

    it "should raise an error if host missing from config" do
      YAML.stub!(:load_file).with(@yaml_config_path).and_return('production' => {})
      lambda do
        @config.to_hash
      end.should raise_error(Captivate::ConfigError, "Missing 'host' for production environment")
    end
  end
end

describe Captivate::RemoteDir do
  before do
    Captivate::SystemCall.stub!(:new)
  end
  
  it "should create a directory" do
    Captivate::SystemCall.should_receive(:new).with('ssh the_host mkdir the_path')
    Captivate::RemoteDir.new(:host => 'the_host', :path => 'the_path')
  end
  
  it "should raise an error if missing file" do
    @remote_dir = Captivate::RemoteDir.new(:host => 'the_host', :path => 'the_path')
    lambda do
      @remote_dir.upload('local_path/a_file')
    end.should raise_error(Errno::ENOENT, 'No such file or directory - local_path/a_file')
  end
  
  it "should create a subdirectory" do
    @remote_dir = Captivate::RemoteDir.new(:host => 'the_host', :path => 'the_path')
    Captivate::RemoteDir.should_receive(:new).with(:host => 'the_host', :path => 'the_path/a_dir')
    @remote_dir.new_subdir('a_dir')
  end

  context 'when uploading file which exists' do
    before do
      File.stub!(:exists?).and_return(true)
    end

    it "should upload a file" do
      @remote_dir = Captivate::RemoteDir.new(:host => 'the_host', :path => 'the_path')
      Captivate::SystemCall.should_receive(:new).with('scp local_path/a_file the_host:the_path/a_file')
      @remote_dir.upload('local_path/a_file')
    end

    it "should upload a file and rename" do
      @remote_dir = Captivate::RemoteDir.new(:host => 'the_host', :path => 'the_path')
      Captivate::SystemCall.should_receive(:new).with('scp a_file the_host:the_path/new_name')
      @remote_dir.upload('a_file', 'new_name')
    end

    it "should upload a directory" do
      @remote_dir = Captivate::RemoteDir.new(:host => 'the_host', :path => 'the_path')
      Captivate::SystemCall.should_receive(:new).with('scp -r local_path/a_dir the_host:the_path/a_dir')
      File.should_receive(:directory?).with('local_path/a_dir').and_return(true)
      @remote_dir.upload('local_path/a_dir')
    end
  end
end

describe Captivate::RemoteScript do
  before do
    @file = mock('file')
    @file.stub!(:path)
    @file.stub!(:write)
    Tempfile.should_receive(:open).and_yield(@file)
    @remote_script = lambda do
      Captivate::RemoteScript.new(:command => 'some cap commands', :remote_path => 'the_remote_path')
    end
  end
  
  it "should contain cap command in script" do
    @file.should_receive(:write) do |shell_script|
      shell_script.should include('some cap commands')
    end
    @remote_script.call
  end

  it "should contain remote script path in script" do
    @file.should_receive(:write) do |shell_script|
      shell_script.should include('the_remote_path')
    end
    @remote_script.call
  end
  
  it "should return path" do
    @file.should_receive(:path).and_return('some_path')
    @remote_script.call
  end
end
