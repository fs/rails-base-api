source "https://rubygems.org"

ruby "2.5.1"

# the most important stuff
gem "pg"
gem "rails", "5.2.1"

# all other gems
gem "active_model_serializers"
gem "bcrypt"
gem "bootsnap", require: false
gem "decent_exposure"
gem "health_check"
gem "interactor"
gem "kaminari"
gem "knock"
gem "puma"
gem "responders"
gem "rollbar"
gem "seedbank"

group :development do
  gem "bullet"
  gem "foreman"
  gem "letter_opener"

  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-commands-rspec"
end

group :development, :test do
  gem "byebug"
  gem "dotenv-rails"
  gem "rspec-rails"

  gem "brakeman"
  gem "bundler-audit"
  gem "rubocop"
  gem "rubocop-rspec"
end

group :test do
  gem "simplecov", require: false
  gem "webmock", require: false

  gem "database_cleaner"
  gem "email_spec"
  gem "json_matchers"
  gem "json_spec"
  gem "shoulda-matchers", require: false
end

group :development, :test, :staging do
  gem "apitome", require: false
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec_api_documentation"
end
