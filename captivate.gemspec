# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{captivate}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Zubin Henner"]
  s.date = %q{2010-04-20}
  s.default_executable = %q{captivate}
  s.description = %q{If your internet connection fails during a deploy, the deploy fails. And that means your site could stop functioning. Ouch. Deploy reliably and quickly from anywhere with slow or unreliable internet connections.

It works by invoking the capistrano command from a remote server using `screen`. To ensure tasks run the same as if invoked locally, cap files are first copied to remote server via `scp`.}
  s.email = %q{zubin@zenlunacy.com}
  s.executables = ["captivate"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "bin/captivate",
     "captivate-0.0.0.gem",
     "captivate.gemspec",
     "lib/captivate.rb",
     "spec/acceptance_spec.rb",
     "spec/captivate_spec.rb",
     "spec/fixtures/rails_apps/multi_stage/Capfile",
     "spec/fixtures/rails_apps/multi_stage/README",
     "spec/fixtures/rails_apps/multi_stage/Rakefile",
     "spec/fixtures/rails_apps/multi_stage/app/controllers/application_controller.rb",
     "spec/fixtures/rails_apps/multi_stage/app/helpers/application_helper.rb",
     "spec/fixtures/rails_apps/multi_stage/config/boot.rb",
     "spec/fixtures/rails_apps/multi_stage/config/captivate.yml",
     "spec/fixtures/rails_apps/multi_stage/config/database.yml",
     "spec/fixtures/rails_apps/multi_stage/config/deploy.rb",
     "spec/fixtures/rails_apps/multi_stage/config/deploy/staging.rb",
     "spec/fixtures/rails_apps/multi_stage/config/environment.rb",
     "spec/fixtures/rails_apps/multi_stage/config/environments/development.rb",
     "spec/fixtures/rails_apps/multi_stage/config/environments/production.rb",
     "spec/fixtures/rails_apps/multi_stage/config/environments/test.rb",
     "spec/fixtures/rails_apps/multi_stage/config/initializers/backtrace_silencers.rb",
     "spec/fixtures/rails_apps/multi_stage/config/initializers/inflections.rb",
     "spec/fixtures/rails_apps/multi_stage/config/initializers/mime_types.rb",
     "spec/fixtures/rails_apps/multi_stage/config/initializers/new_rails_defaults.rb",
     "spec/fixtures/rails_apps/multi_stage/config/initializers/session_store.rb",
     "spec/fixtures/rails_apps/multi_stage/config/locales/en.yml",
     "spec/fixtures/rails_apps/multi_stage/config/routes.rb",
     "spec/fixtures/rails_apps/multi_stage/db/seeds.rb",
     "spec/fixtures/rails_apps/multi_stage/doc/README_FOR_APP",
     "spec/fixtures/rails_apps/multi_stage/log/development.log",
     "spec/fixtures/rails_apps/multi_stage/log/production.log",
     "spec/fixtures/rails_apps/multi_stage/log/server.log",
     "spec/fixtures/rails_apps/multi_stage/log/test.log",
     "spec/fixtures/rails_apps/multi_stage/public/404.html",
     "spec/fixtures/rails_apps/multi_stage/public/422.html",
     "spec/fixtures/rails_apps/multi_stage/public/500.html",
     "spec/fixtures/rails_apps/multi_stage/public/favicon.ico",
     "spec/fixtures/rails_apps/multi_stage/public/images/rails.png",
     "spec/fixtures/rails_apps/multi_stage/public/index.html",
     "spec/fixtures/rails_apps/multi_stage/public/javascripts/application.js",
     "spec/fixtures/rails_apps/multi_stage/public/javascripts/controls.js",
     "spec/fixtures/rails_apps/multi_stage/public/javascripts/dragdrop.js",
     "spec/fixtures/rails_apps/multi_stage/public/javascripts/effects.js",
     "spec/fixtures/rails_apps/multi_stage/public/javascripts/prototype.js",
     "spec/fixtures/rails_apps/multi_stage/public/robots.txt",
     "spec/fixtures/rails_apps/multi_stage/script/about",
     "spec/fixtures/rails_apps/multi_stage/script/console",
     "spec/fixtures/rails_apps/multi_stage/script/dbconsole",
     "spec/fixtures/rails_apps/multi_stage/script/destroy",
     "spec/fixtures/rails_apps/multi_stage/script/generate",
     "spec/fixtures/rails_apps/multi_stage/script/performance/benchmarker",
     "spec/fixtures/rails_apps/multi_stage/script/performance/profiler",
     "spec/fixtures/rails_apps/multi_stage/script/plugin",
     "spec/fixtures/rails_apps/multi_stage/script/runner",
     "spec/fixtures/rails_apps/multi_stage/script/server",
     "spec/fixtures/rails_apps/multi_stage/test/performance/browsing_test.rb",
     "spec/fixtures/rails_apps/multi_stage/test/test_helper.rb",
     "spec/fixtures/rails_apps/no_cap/README",
     "spec/fixtures/rails_apps/no_cap/Rakefile",
     "spec/fixtures/rails_apps/no_cap/app/controllers/application_controller.rb",
     "spec/fixtures/rails_apps/no_cap/app/helpers/application_helper.rb",
     "spec/fixtures/rails_apps/no_cap/config/boot.rb",
     "spec/fixtures/rails_apps/no_cap/config/database.yml",
     "spec/fixtures/rails_apps/no_cap/config/environment.rb",
     "spec/fixtures/rails_apps/no_cap/config/environments/development.rb",
     "spec/fixtures/rails_apps/no_cap/config/environments/production.rb",
     "spec/fixtures/rails_apps/no_cap/config/environments/test.rb",
     "spec/fixtures/rails_apps/no_cap/config/initializers/backtrace_silencers.rb",
     "spec/fixtures/rails_apps/no_cap/config/initializers/inflections.rb",
     "spec/fixtures/rails_apps/no_cap/config/initializers/mime_types.rb",
     "spec/fixtures/rails_apps/no_cap/config/initializers/new_rails_defaults.rb",
     "spec/fixtures/rails_apps/no_cap/config/initializers/session_store.rb",
     "spec/fixtures/rails_apps/no_cap/config/locales/en.yml",
     "spec/fixtures/rails_apps/no_cap/config/routes.rb",
     "spec/fixtures/rails_apps/no_cap/db/seeds.rb",
     "spec/fixtures/rails_apps/no_cap/doc/README_FOR_APP",
     "spec/fixtures/rails_apps/no_cap/log/development.log",
     "spec/fixtures/rails_apps/no_cap/log/production.log",
     "spec/fixtures/rails_apps/no_cap/log/server.log",
     "spec/fixtures/rails_apps/no_cap/log/test.log",
     "spec/fixtures/rails_apps/no_cap/public/404.html",
     "spec/fixtures/rails_apps/no_cap/public/422.html",
     "spec/fixtures/rails_apps/no_cap/public/500.html",
     "spec/fixtures/rails_apps/no_cap/public/favicon.ico",
     "spec/fixtures/rails_apps/no_cap/public/images/rails.png",
     "spec/fixtures/rails_apps/no_cap/public/index.html",
     "spec/fixtures/rails_apps/no_cap/public/javascripts/application.js",
     "spec/fixtures/rails_apps/no_cap/public/javascripts/controls.js",
     "spec/fixtures/rails_apps/no_cap/public/javascripts/dragdrop.js",
     "spec/fixtures/rails_apps/no_cap/public/javascripts/effects.js",
     "spec/fixtures/rails_apps/no_cap/public/javascripts/prototype.js",
     "spec/fixtures/rails_apps/no_cap/public/robots.txt",
     "spec/fixtures/rails_apps/no_cap/script/about",
     "spec/fixtures/rails_apps/no_cap/script/console",
     "spec/fixtures/rails_apps/no_cap/script/dbconsole",
     "spec/fixtures/rails_apps/no_cap/script/destroy",
     "spec/fixtures/rails_apps/no_cap/script/generate",
     "spec/fixtures/rails_apps/no_cap/script/performance/benchmarker",
     "spec/fixtures/rails_apps/no_cap/script/performance/profiler",
     "spec/fixtures/rails_apps/no_cap/script/plugin",
     "spec/fixtures/rails_apps/no_cap/script/runner",
     "spec/fixtures/rails_apps/no_cap/script/server",
     "spec/fixtures/rails_apps/no_cap/test/performance/browsing_test.rb",
     "spec/fixtures/rails_apps/no_cap/test/test_helper.rb",
     "spec/fixtures/rails_apps/single_stage/Capfile",
     "spec/fixtures/rails_apps/single_stage/README",
     "spec/fixtures/rails_apps/single_stage/Rakefile",
     "spec/fixtures/rails_apps/single_stage/app/controllers/application_controller.rb",
     "spec/fixtures/rails_apps/single_stage/app/helpers/application_helper.rb",
     "spec/fixtures/rails_apps/single_stage/config/boot.rb",
     "spec/fixtures/rails_apps/single_stage/config/captivate.yml",
     "spec/fixtures/rails_apps/single_stage/config/database.yml",
     "spec/fixtures/rails_apps/single_stage/config/deploy.rb",
     "spec/fixtures/rails_apps/single_stage/config/environment.rb",
     "spec/fixtures/rails_apps/single_stage/config/environments/development.rb",
     "spec/fixtures/rails_apps/single_stage/config/environments/production.rb",
     "spec/fixtures/rails_apps/single_stage/config/environments/test.rb",
     "spec/fixtures/rails_apps/single_stage/config/initializers/backtrace_silencers.rb",
     "spec/fixtures/rails_apps/single_stage/config/initializers/inflections.rb",
     "spec/fixtures/rails_apps/single_stage/config/initializers/mime_types.rb",
     "spec/fixtures/rails_apps/single_stage/config/initializers/new_rails_defaults.rb",
     "spec/fixtures/rails_apps/single_stage/config/initializers/session_store.rb",
     "spec/fixtures/rails_apps/single_stage/config/locales/en.yml",
     "spec/fixtures/rails_apps/single_stage/config/routes.rb",
     "spec/fixtures/rails_apps/single_stage/db/seeds.rb",
     "spec/fixtures/rails_apps/single_stage/doc/README_FOR_APP",
     "spec/fixtures/rails_apps/single_stage/log/development.log",
     "spec/fixtures/rails_apps/single_stage/log/production.log",
     "spec/fixtures/rails_apps/single_stage/log/server.log",
     "spec/fixtures/rails_apps/single_stage/log/test.log",
     "spec/fixtures/rails_apps/single_stage/public/404.html",
     "spec/fixtures/rails_apps/single_stage/public/422.html",
     "spec/fixtures/rails_apps/single_stage/public/500.html",
     "spec/fixtures/rails_apps/single_stage/public/favicon.ico",
     "spec/fixtures/rails_apps/single_stage/public/images/rails.png",
     "spec/fixtures/rails_apps/single_stage/public/index.html",
     "spec/fixtures/rails_apps/single_stage/public/javascripts/application.js",
     "spec/fixtures/rails_apps/single_stage/public/javascripts/controls.js",
     "spec/fixtures/rails_apps/single_stage/public/javascripts/dragdrop.js",
     "spec/fixtures/rails_apps/single_stage/public/javascripts/effects.js",
     "spec/fixtures/rails_apps/single_stage/public/javascripts/prototype.js",
     "spec/fixtures/rails_apps/single_stage/public/robots.txt",
     "spec/fixtures/rails_apps/single_stage/script/about",
     "spec/fixtures/rails_apps/single_stage/script/console",
     "spec/fixtures/rails_apps/single_stage/script/dbconsole",
     "spec/fixtures/rails_apps/single_stage/script/destroy",
     "spec/fixtures/rails_apps/single_stage/script/generate",
     "spec/fixtures/rails_apps/single_stage/script/performance/benchmarker",
     "spec/fixtures/rails_apps/single_stage/script/performance/profiler",
     "spec/fixtures/rails_apps/single_stage/script/plugin",
     "spec/fixtures/rails_apps/single_stage/script/runner",
     "spec/fixtures/rails_apps/single_stage/script/server",
     "spec/fixtures/rails_apps/single_stage/test/performance/browsing_test.rb",
     "spec/fixtures/rails_apps/single_stage/test/test_helper.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/zubin/captivate}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Captivate your production servers and deploy rails apps reliably, faster. They'll never be distracted by internet dropouts again.}
  s.test_files = [
    "spec/acceptance_spec.rb",
     "spec/captivate_spec.rb",
     "spec/fixtures/rails_apps/multi_stage/app/controllers/application_controller.rb",
     "spec/fixtures/rails_apps/multi_stage/app/helpers/application_helper.rb",
     "spec/fixtures/rails_apps/multi_stage/config/boot.rb",
     "spec/fixtures/rails_apps/multi_stage/config/deploy/staging.rb",
     "spec/fixtures/rails_apps/multi_stage/config/deploy.rb",
     "spec/fixtures/rails_apps/multi_stage/config/environment.rb",
     "spec/fixtures/rails_apps/multi_stage/config/environments/development.rb",
     "spec/fixtures/rails_apps/multi_stage/config/environments/production.rb",
     "spec/fixtures/rails_apps/multi_stage/config/environments/test.rb",
     "spec/fixtures/rails_apps/multi_stage/config/initializers/backtrace_silencers.rb",
     "spec/fixtures/rails_apps/multi_stage/config/initializers/inflections.rb",
     "spec/fixtures/rails_apps/multi_stage/config/initializers/mime_types.rb",
     "spec/fixtures/rails_apps/multi_stage/config/initializers/new_rails_defaults.rb",
     "spec/fixtures/rails_apps/multi_stage/config/initializers/session_store.rb",
     "spec/fixtures/rails_apps/multi_stage/config/routes.rb",
     "spec/fixtures/rails_apps/multi_stage/db/seeds.rb",
     "spec/fixtures/rails_apps/multi_stage/test/performance/browsing_test.rb",
     "spec/fixtures/rails_apps/multi_stage/test/test_helper.rb",
     "spec/fixtures/rails_apps/no_cap/app/controllers/application_controller.rb",
     "spec/fixtures/rails_apps/no_cap/app/helpers/application_helper.rb",
     "spec/fixtures/rails_apps/no_cap/config/boot.rb",
     "spec/fixtures/rails_apps/no_cap/config/environment.rb",
     "spec/fixtures/rails_apps/no_cap/config/environments/development.rb",
     "spec/fixtures/rails_apps/no_cap/config/environments/production.rb",
     "spec/fixtures/rails_apps/no_cap/config/environments/test.rb",
     "spec/fixtures/rails_apps/no_cap/config/initializers/backtrace_silencers.rb",
     "spec/fixtures/rails_apps/no_cap/config/initializers/inflections.rb",
     "spec/fixtures/rails_apps/no_cap/config/initializers/mime_types.rb",
     "spec/fixtures/rails_apps/no_cap/config/initializers/new_rails_defaults.rb",
     "spec/fixtures/rails_apps/no_cap/config/initializers/session_store.rb",
     "spec/fixtures/rails_apps/no_cap/config/routes.rb",
     "spec/fixtures/rails_apps/no_cap/db/seeds.rb",
     "spec/fixtures/rails_apps/no_cap/test/performance/browsing_test.rb",
     "spec/fixtures/rails_apps/no_cap/test/test_helper.rb",
     "spec/fixtures/rails_apps/single_stage/app/controllers/application_controller.rb",
     "spec/fixtures/rails_apps/single_stage/app/helpers/application_helper.rb",
     "spec/fixtures/rails_apps/single_stage/config/boot.rb",
     "spec/fixtures/rails_apps/single_stage/config/deploy.rb",
     "spec/fixtures/rails_apps/single_stage/config/environment.rb",
     "spec/fixtures/rails_apps/single_stage/config/environments/development.rb",
     "spec/fixtures/rails_apps/single_stage/config/environments/production.rb",
     "spec/fixtures/rails_apps/single_stage/config/environments/test.rb",
     "spec/fixtures/rails_apps/single_stage/config/initializers/backtrace_silencers.rb",
     "spec/fixtures/rails_apps/single_stage/config/initializers/inflections.rb",
     "spec/fixtures/rails_apps/single_stage/config/initializers/mime_types.rb",
     "spec/fixtures/rails_apps/single_stage/config/initializers/new_rails_defaults.rb",
     "spec/fixtures/rails_apps/single_stage/config/initializers/session_store.rb",
     "spec/fixtures/rails_apps/single_stage/config/routes.rb",
     "spec/fixtures/rails_apps/single_stage/db/seeds.rb",
     "spec/fixtures/rails_apps/single_stage/test/performance/browsing_test.rb",
     "spec/fixtures/rails_apps/single_stage/test/test_helper.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
  end
end

