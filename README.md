# Skeleton for new Rails 5 application for REST API

[![Build Status](https://semaphoreci.com/api/v1/fs/rails-base-api/branches/master/shields_badge.svg)](https://semaphoreci.com/fs/rails-base-api)
[![Known Vulnerabilities](https://snyk.io/test/github/fs/rails-base-api/badge.svg)](https://snyk.io/test/github/fs/rails-base-api)

This simple application includes Ruby/Rails technology which we use at Flatstack for new REST API projects. Application currently based on Rails 5 stable branch and Ruby 2.5.1

## What's included

### Application gems:

* [active_model_serializers](https://github.com/rails-api/active_model_serializers) - resource serializers
* [decent_exposure](https://github.com/voxdolo/decent_exposure) for DRY controllers
* [health_check](https://github.com/ianheggie/health_check) - health check endpoint
* [interactor](https://github.com/collectiveidea/interactor) – encapsulates business logic
* [kaminari](https://github.com/amatsuda/kaminari) for pagination
* [knock](https://github.com/nsarno/knock) – seamless JWT authentication
* [puma](https://github.com/puma/puma) as Rails web server
* [rack-cors](https://github.com/cyu/rack-cors) for [CORS](http://en.wikipedia.org/wiki/Cross-origin_resource_sharing)
* [responders](https://github.com/plataformatec/responders) - DRY controllers
* [rollbar](https://github.com/rollbar/rollbar-gem) for exception notification

### Development gems

* [brakeman](https://github.com/presidentbeef/brakeman) - static analysis security vulnerability scanner
* [bullet](https://github.com/flyerhzm/bullet) - kill n+1 queries and unused eager loading
* [bundler-audit](https://github.com/rubysec/bundler-audit) - patch-level verification for gems
* [dotenv](https://github.com/bkeepers/dotenv) - load environment variables from `.env`
* [letter_opener](https://github.com/ryanb/letter_opener) - preview E-Mails in the browser instead of sending
* [rails-erd](https://github.com/voormedia/rails-erd) - generate a diagram based on application's AR models
* [seedbank](https://github.com/james2m/seedbank) - seeds on steroids

### Testing gems

* [factory bot](https://github.com/thoughtbot/factory_bot) - create test data
* [faker](https://github.com/stympy/faker) - generate fake data
* [rspec api documentation](https://github.com/zipmark/rspec_api_documentation) - generate pretty API docs
* [rspec](https://github.com/rspec/rspec) - awesome, readable isolation testing
* [shoulda matchers](http://github.com/thoughtbot/shoulda-matchers) - frequently needed Rails and RSpec matchers

### Non standard initializes

* `active_model_serializer.rb` - setup serializers for REST API
* `bullet.rb` - setup Bullet to catch up N+1
* `cors.rb` - setup whitelist of domains to allow cross-origin resource sharing
* `health_check.rb` - setup Health Check endpoint
* `rollbar.rb` - setup Rollbar

### Scripts

* `bin/setup` - build Docker image and prepare DB
* `docker-compose up` - to run server locally
* `docker-compose run app bin/rspec` - runs RSpec tests
* `docker-compose run app bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `docker-compose run app bin/doc` - should be used to generate API documentation

## Quick start

Clone application as new project with original repository named "rails-base-api"

```bash
git clone git://github.com/fs/rails-base-api.git --origin rails-base-api [MY-NEW-PROJECT]
```

Create your new repo on GitHub and push master into it.
Make sure master branch is tracking origin repo.

```bash
git remote add origin git@github.com:[MY-GITHUB-ACCOUNT]/[MY-NEW-PROJECT].git
git push -u origin master
```

Run setup script

```bash
bin/setup
```

Make sure all test are green

```bash
docker-compose run app bin/quality
```

Run app

```bash
docker-compose up
```

**Do not forget to update this file!**

```bash
mv doc/README_TEMPLATE.md README.md
# update README.md
git commit -am "Update README.md"
```

## Examples

Please check how to build API endpoints and test them properly in the
[examples branch](https://github.com/fs/rails-base-api/tree/examples)

[<img src="http://www.flatstack.com/logo.svg" width="100"/>](http://www.flatstack.com)
