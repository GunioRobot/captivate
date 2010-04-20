require 'tempfile'
module Captivate
  class Command
    attr_reader :path

    def initialize(args = nil)
      @args = args
    end

    def invoke
      config = Config.new(config_options).to_hash
      @host = config['host']
      @path = config['working_path']
      @remote_dir = RemoteDir.new(:host => @host, :path => @path)
      @remote_dir.upload('Capfile')
      @remote_config_dir = @remote_dir.new_subdir('config')
      @remote_config_dir.upload('config/deploy.rb')
      @remote_config_dir.upload('config/deploy') if File.directory?('config/deploy')
      @remote_script = RemoteScript.new(:command => command, :remote_path => @path)
      remote_script_path = @remote_script.local_path
      File.chmod(0555, remote_script_path)
      @remote_dir.upload(remote_script_path, 'captivate-remote.sh')
      SystemCall.new(%{ssh -t #{@host} screen #{@path}/captivate-remote.sh})
    end
  
  private
    
    def self.remote_script_path
      File.join(File.dirname(__FILE__), '/../bin/captivate-remote.sh')
    end
    
    def command
      @args * ' '
    end
    
    def config_options
      {:command => command, :rails_root => rails_root}
    end
    
    def rails_root
      FileUtils.pwd
    end
  end

  class Config
    def initialize(options = {})
      @command    = options[:command]    or raise(ConfigError, "Missing 'command' option")
      @rails_root = options[:rails_root] or raise(ConfigError, "Missing 'rails_root' option")
    end
    
    def to_hash
      validate_yaml_config
      { 'working_path' => working_path }.merge(yaml_config[environment])
    end
  
  private
    
    def working_path
      '/tmp/captivate.%s' % [timestamp, app_name, environment, user].join('.')
    end
    
    def timestamp
      Time.now.to_i
    end
    
    def app_name
      File.basename(@rails_root)
    end
    
    def environment
      if config_stages.include?(commands.first) && multistage_stages.include?(commands.first)
        commands.first
      else
        'production'
      end
    end
    
    def config_stages
      yaml_config.keys
    end
    
    def multistage_stages
      if multistage?
        set_stages_code = deploy_file_contents[/set :stages,\s?([^\n]+)\n/, 1] or
          raise(ConfigError, "'set :stages' definition not found")
        stages_array = eval(set_stages_code)
      else
        []
      end
    end
    
    def deploy_file_contents
      File.read(deploy_file_path)
    end
    
    def deploy_file_path
      "#{@rails_root}/config/deploy.rb"
    end
    
    def multistage?
      deploy_file_contents.match(%r(\A\s*require (['"])capistrano/ext/multistage\1)) ||
      deploy_file_contents.match(%r(\n\s*require (['"])capistrano/ext/multistage\1))
    end
    
    def commands
      @command.split(/\s+/)
    end
    
    def user
      Etc.getlogin
    end
    
    def validate_yaml_config
      raise(ConfigError, yaml_config_path) unless File.exists?(yaml_config_path)
      raise(ConfigError, "Missing #{environment} environment") unless yaml_config.keys.include?(environment)
      unless yaml_config[environment].keys.include?('host')
        raise(ConfigError, "Missing 'host' for #{environment} environment")
      end
    end
    
    def yaml_config
      @yaml_config ||= YAML.load_file(yaml_config_path)
    end
    
    def yaml_config_path
      File.join(@rails_root, 'config/captivate.yml')
    end
  end

  class RemoteDir
    def initialize(options)
      @host, @path = options[:host], options[:path]
      SystemCall.new("ssh #{@host} mkdir #{@path}")
    end
    
    def upload(file_path, dest_filename = file_path)
      raise(Errno::ENOENT, file_path) unless File.exists?(file_path)
      if File.directory?(file_path)
        SystemCall.new("scp -r #{file_path} #{@host}:#{@path}/#{File.basename(dest_filename)}")
      else
        SystemCall.new("scp #{file_path} #{@host}:#{@path}/#{File.basename(dest_filename)}")
      end
    end
    
    def new_subdir(dirname)
      self.class.new(:host => @host, :path => "#{@path}/#{dirname}")
    end
  end
  
  class RemoteScript
    attr_reader :local_path, :remote_path, :command
    def initialize(options)
      @command = options[:command]
      @remote_path = options[:remote_path]
      Tempfile.open('captivate_remote_script') do |f|
        @local_path = f.path
        f.write(converted_template)
      end
    end
    
  private
    
    def converted_template
      template.gsub('### CAP COMMANDS ###', command).gsub('### CD REMOTE PATH ###', "cd #{remote_path}")
    end
    
    def template
      <<-EOS
#!/usr/bin/env bash
# Deploys app. Executed remotely from deploy host.
trap 'echo "-->  Aborted.  Press Enter to continue..."; read; exit' ERR
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
if [ -f ~/.profile ]; then
  . ~/.profile
fi
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi
### CD REMOTE PATH ###
echo "-->  Executing:  "
echo "cap ### CAP COMMANDS ###"
cap ### CAP COMMANDS ###
echo "-->  Completed.  Press Enter to continue..."
read
      EOS
    end
  end
  
  class SystemCall
    def initialize(command)
      system(command)
    end
  end
  
  class ConfigError < StandardError
  end
end
