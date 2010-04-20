Captivate
=========

![Rudi van DiSarzio, unofficial Captivate mascot](http://zenlunacy.com/Rudi-van-DiSarzio.jpg "Rudi van DiSarzio, unofficial Captivate mascot")

*Captivate your production servers and deploy rails apps reliably, faster.
They'll never be distracted by internet dropouts again.*

If your internet connection fails during a deploy, the deploy fails. And that
means your site could stop functioning. Ouch. Deploy reliably and quickly from
anywhere with slow or unreliable internet connections.

It works by invoking the capistrano command from a remote server using
`screen`. To ensure tasks run the same as if invoked locally, cap files are
first copied to remote server via `scp`.

### Sample use

    cd path/to/my_app
    captivate deploy

Download and install
--------------------

### Install as a gem

    gem install captivate --source http://rubygems.org

### Configure your rails app

Tell captivate which server(s) to use for each environment in
`config/captivate.yml`.

    # RAILS_ROOT/config/captivate.yml
    production:
      host: deploy.example.com
    staging:
      host: staging.example.com
    showcase:
      host: showcase.example.com

Your remote machine must have capistrano installed.

Community
---------

* [Source code](http://github.com/zubin/captivate)
* [Questions?](http://groups.google.com/group/captivate-rubygem)

### Contributors

Special thanks goes to [Perryn Fowler](http://github.com/perryn) for helping
write sane tests and restructuring.

### TODO

* Better error messages when something fails
* Add help and version command line options (`-h/--help` and `-v/--version`)
* Write to remote log using `tee` (eg: `$ echo SOMETHING 2>&1 |tee logfile`)
* Extra config YAML options:
  * `mailto: [email(s) to receive logile, comma separated]`
  * `prevent_noncaptivate_deploy: true`
* Copy sample YAML to config/captivate.yml via `script/generate captivate`
* Purge previous captivate working directories (older than 1 week?)

### Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version
  unintentionally.
* Commit, do not mess with rakefile, version, or history. (if you want to have
  your own version, that is fine but bump version in a commit by itself I can
  ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

### Copyright

Copyright (c) 2010 Zubin Henner. See LICENSE for details.
