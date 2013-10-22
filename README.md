# Example of Rails app with API

## API

Status of the API could be checked at http://localhost:5000/api_taster

### Unauthenticated user:

* POST `/users/sign_in.json`: Authenticate user with given email and password
* GET `/posts.json`: list posts
* GET `/posts/:id.json`: get a single post

### Authenticated as user:

* GET `/user/comments.json`: list comments for currently authenticated user
* POST `/user/comments.json`: create comment

## What's included

Application currently based on Rails 4 and Ruby 2

### Application gems:

* [Decent Exposure](https://github.com/voxdolo/decent_exposure) for DRY controllers
* [Airbrake](https://github.com/airbrake/airbrake) for exception notification
* [Thin](https://github.com/macournoyer/thin) as rails web server

### Development gems

* [Foreman](https://github.com/ddollar/foreman) for managing development stack with Procfile
* [Letter Opener](https://github.com/ryanb/letter_opener) for preview mail in the browser instead of sending
* [Mail Safe](https://github.com/myronmarston/mail_safe) keep ActionMailer emails from escaping into the wild during development
* [Bullet](https://github.com/flyerhzm/bullet) gem to kill N+1 queries and unused eager loading
* [Rails Best Practices](https://github.com/railsbp/rails_best_practices) code metric tool
* [Brakeman](https://github.com/presidentbeef/brakeman) static analysis security vulnerability scanner

### Testing gems

* [Factory Girl](https://github.com/thoughtbot/factory_girl) for easier creation of test data
* [RSpec](https://github.com/rspec/rspec) for awesome, readable isolation testing
* [Shoulda Matchers](http://github.com/thoughtbot/shoulda-matchers) for frequently needed Rails and RSpec matchers
* [Email Spec](https://github.com/bmabey/email-spec) Collection of rspec matchers and cucumber steps for testing emails
* [ApiTaster](https://github.com/fredwu/api_taster) A quick and easy way to visually test your Rails application's API.

### Initializes

* `01_config.rb` - shortcut for getting application config with `app_config`
* `mailer.rb` - setup default hosts for mailer from configuration
* `time_formats.rb` - setup default time formats, so you can use them like object.create_at.to_s(:us_time)
* `requires.rb` - automatically requires everything in lib/ & lib/extensions

### Scripts

* `script/bootstrap` - setup required gems and migrate db if needed
* `script/quality` - runs brakeman and rails_best_practices for the app
* `script/ci` - should be used in the CI, checkout .travis.yml for example
