require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "captivate"
    gem.summary = %Q{Captivate your production servers and deploy rails apps reliably, faster. They'll never be distracted by internet dropouts again.}
    gem.description = %Q{If your internet connection fails during a deploy, the deploy fails. And that means your site could stop functioning. Ouch. Deploy reliably and quickly from anywhere with slow or unreliable internet connections.\n\nIt works by invoking the capistrano command from a remote server using `screen`. To ensure tasks run the same as if invoked locally, cap files are first copied to remote server via `scp`.}
    gem.email = "zubin@zenlunacy.com"
    gem.homepage = "http://github.com/zubin/captivate"
    gem.authors = ["Zubin Henner"]
    gem.add_development_dependency "rspec", ">= 1.3.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "captivate #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
