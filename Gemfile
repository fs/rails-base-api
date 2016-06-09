source "https://rubygems.org"

ruby "2.3.1"

# the most important stuff
gem "rails", "4.2.5.2"
gem "pg"
gem "rails-api"
gem "rails_api_format", path: "lib/rails_api_format"

# all other gems
gem "active_model_serializers", git: "https://github.com/rails-api/active_model_serializers.git"
gem "decent_exposure"
gem "devise"
gem "dotenv-rails"
gem "interactor"
gem "kaminari"
gem "rack-cors", require: "rack/cors"
gem "responders"
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
  gem "rollbar"
  gem "rails_12factor"
end
