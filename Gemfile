source "https://rubygems.org"

ruby "2.3.1"

# the most important stuff
gem "rails", "4.2.7.1"
gem "pg"
gem "rails-api"

# all other gems
gem "decent_exposure"
gem "devise"
gem "dotenv-rails"
gem "health_check"
gem "interactor"
gem "jsonapi-utils", "~> 0.5.0.beta3"
gem "kaminari"
gem "pundit"
gem "rack-cors", require: "rack/cors"
gem "responders"
gem "rollbar"
gem "seedbank"
gem "simple_token_authentication"
gem "thin"

group :development do
  gem "letter_opener"
  gem "foreman"
  gem "bullet"

  gem "spring"
  gem "spring-commands-rspec"
end

group :development, :test do
  gem "byebug"
  gem "rspec-rails"
  gem "mail_safe"

  gem "rails_best_practices"
  gem "brakeman"
  gem "rubocop"
  gem "bundler-audit"
  gem "pry-rails"
end

group :test do
  gem "simplecov", require: false
  gem "webmock", require: false

  gem "database_cleaner"
  gem "email_spec"
  gem "shoulda-matchers", require: false
  gem "json_spec"
end

group :development, :test, :staging do
  gem "faker"
  gem "factory_girl_rails"
  gem "rspec_api_documentation"
  gem "apitome"
end

group :staging, :production do
  gem "rails_12factor"
end
