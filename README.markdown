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

Multi-stage is supported:

    cd path/to/my_app
    captivate staging deploy:migrations TAG=v2.3-RC1

Download and install
--------------------

### Install as a gem

    gem install captivate

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
* [Bugs?](http://github.com/zubin/captivate/issues)

### Contributors

Special thanks goes to [Perryn Fowler](http://github.com/perryn) for helping
write sane tests and restructuring.


### Copyright

Copyright (c) 2010 Zubin Henner. See LICENSE for details.
