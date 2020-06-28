# Example of deploying Ruby on Rails application with Capistrano

## Overview

The application is a copy of [TracksApp/tracks](https://github.com/TracksApp/tracks) with
a few commits added to allow it to be deployed with Capistrano.

The application is deployed to a single server.  The infrastructure code can be found
in [gtrafimenkov/devops-labs/blob/master/a020-deploy-ror-with-capistrano](https://github.com/gtrafimenkov/devops-labs/blob/master/a020-deploy-ror-with-capistrano/readme.md).

This [commit](XXX) shows what it takes to add Capistrano deploy configuration.

## How to deploy

- configure infrastructure (see [instructions](https://github.com/gtrafimenkov/devops-labs/blob/master/a020-deploy-ror-with-capistrano/readme.md))
- deploy application with command: `bundle exec cap production deploy`
- open http://10.116.120.11

## Consulting

If you need help with DevOps work,
don't hesitate to contact gennady.trafimenkov@gmail.com.

## License

GPL v2
