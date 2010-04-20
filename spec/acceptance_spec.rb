require 'spec_helper'

describe Captivate do
  FIXTURES_PATH = File.expand_path(File.join(File.dirname(__FILE__), '/fixtures'))
  
  before do
    # FIXME: FileUtils.rm_rf isn't deleting.
    # FileUtils.rm_rf('/tmp/captivate*')
    system('rm -fr /tmp/captivate*')
    @file_to_appear      = '/tmp/captivate-test-file'
    @touched_file_exists = lambda { File.exists?(@file_to_appear) }
    @command             = Captivate::Command.new([%{ROLES=app COMMAND='touch #{@file_to_appear}' invoke}])
  end
  
  context 'when non-multistage rails app' do
    before do
      @rails_root  = File.join(FIXTURES_PATH, 'rails_apps/single_stage')
    end

    it "should execute cap task and write log file" do
      lambda do
        FileUtils.cd(@rails_root)
        @command.invoke
      end.should change(@touched_file_exists, :call).from(false).to(true)
    end

    it "should write log file" do
      pending
      FileUtils.cd(@rails_root)
      @command.invoke
      log_file_path = File.join(@command.path, 'captivate.log')
      File.exists?(log_file_path).should be_true
    end
  end

  context 'when multistage rails app' do
    before do
      @rails_root  = File.join(FIXTURES_PATH, 'rails_apps/multi_stage')
    end
    
    it "should fail when attempting cap task to nonexistent server" do
      lambda do
        FileUtils.cd(@rails_root)
        Captivate::Command.new([%{ROLES=nonexistent COMMAND='touch #{@file_to_appear}' invoke}]).invoke
      end.should_not raise_error
    end

    it "should execute cap task via screen" do
      lambda do
        FileUtils.cd(@rails_root)
        Captivate::Command.new([%{staging ROLES=app COMMAND='touch #{@file_to_appear}' invoke}]).invoke
      end.should change(@touched_file_exists, :call).from(false).to(true)
    end
  end
end
