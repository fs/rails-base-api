# Skeleton for new Rails 4 application for REST API

[![Code Climate](https://codeclimate.com/github/fs/rails-base-api.png)](https://codeclimate.com/github/fs/rails-base-api)
[![Semaphore](https://semaphoreapp.com/api/v1/projects/0e00006725dcea00b179fab81a1b1bdaf9a64816/106819/shields_badge.png)](https://semaphoreapp.com/fs/rails-base-api)

This simple application includes ruby/rails technology which we use at FlatStack for new REST API projects.

Application currently based on Rails 4 stable branch and Ruby 2.2

## API

Status of the API could be checked at [http://localhost:5000/docs](http://localhost:5000/docs)

## What's included

### Application gems:

* [Decent Exposure](https://github.com/voxdolo/decent_exposure) for DRY controllers
* [Rollbar](https://github.com/rollbar/rollbar-gem) for exception notification
* [Thin](https://github.com/macournoyer/thin) as rails web server
* [Kaminari](https://github.com/amatsuda/kaminari) for pagination
* [Rack CORS](https://github.com/cyu/rack-cors) for [CORS](http://en.wikipedia.org/wiki/Cross-origin_resource_sharing)

### Development gems

* [Foreman](https://github.com/ddollar/foreman) for managing development stack with Procfile
* [Letter Opener](https://github.com/ryanb/letter_opener) for preview mail in the browser instead of sending
* [Mail Safe](https://github.com/myronmarston/mail_safe) keep ActionMailer emails from escaping into the wild during development
* [Bullet](https://github.com/flyerhzm/bullet) gem to kill N+1 queries and unused eager loading
* [Rails Best Practices](https://github.com/railsbp/rails_best_practices) code metric tool
* [Brakeman](https://github.com/presidentbeef/brakeman) static analysis security vulnerability scanner
* [Bundler Audit](https://github.com/rubysec/bundler-audit) Patch-level verification for Gems
* [Spring](https://github.com/rails/spring) for fast Rails actions via pre-loading

### Testing gems

* [Factory Girl](https://github.com/thoughtbot/factory_girl) for easier creation of test data
* [RSpec](https://github.com/rspec/rspec) for awesome, readable isolation testing
* [Shoulda Matchers](http://github.com/thoughtbot/shoulda-matchers) for frequently needed Rails and RSpec matchers
* [Email Spec](https://github.com/bmabey/email-spec) Collection of rspec matchers and cucumber steps for testing emails
* [Rspec Api Documentation](https://github.com/zipmark/rspec_api_documentation) Generate pretty API docs for your Rails APIs

### Initializes

* `01_config.rb` - shortcut for getting application config with `app_config`
* `mailer.rb` - setup default hosts for mailer from configuration
* `requires.rb` - automatically requires everything in lib/ & lib/extensions
* `rack_cors.rb` - setup whitelist of domains to allow cross-origin resource sharing

### Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `bin/ci` - should be used in the CI or locally
* `bin/server` - to run server locally

### Serializers

### PaginatedArraySerializer

Use that serializer if you want to add meta with pagination info on response

```ruby
def index
  respond_with(
    posts,
    serializer: PaginatedArraySerializer
  )
end
```

The above usage of `PaginatedArraySerializer` will produce the following:

```json
{
  "meta": {
    "pagination": {
      "total":46,
      "per_page":2,
      "page":1
    }
  },
  "posts": [
    { "title": "Post 1", "body": "Hello!" },
    { "title": "Post 2", "body": "Goodbye!" }
  ]
}
```

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

Run bootstrap script

```bash
bin/bootstrap
```

Make sure all test are green

```bash
bin/ci
```

Run app

```bash
bin/server
```

**Do not forget to update this file!**

```bash
mv doc/README_TEMPLATE.md README.md
# update README.md
git commit -am "Update README.md"
```

### Restrict access to documentation

You can enable restrict access to documentation by adding `APITOME_USER` and `APITOME_PASSWORD` environment variables. Can be useful on staging environment.

## Examples

Please check how to build API endpoints and test them properly in the
[examples branch](https://github.com/fs/rails-base-api/tree/examples)
