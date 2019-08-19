source "https://rubygems.org"

ruby "2.5.1"

# the most important stuff
gem "pg"
gem "rails", "5.2.3"

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
gem "rack-cors"
gem "raddocs"
gem "responders"
gem "rollbar"
gem "seedbank"

group :development do
  gem "bullet"
  gem "letter_opener"
  gem "rails-erd"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
end

group :development, :test do
  gem "brakeman"
  gem "bundler-audit"
  gem "byebug"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop"
  gem "rubocop-rspec"
end

group :test do
  gem "email_spec"
  gem "rspec_api_documentation"
  gem "shoulda-matchers", require: false
  gem "timecop"
  gem "webmock", require: false
end

group :development, :test, :staging do
  gem "factory_bot_rails"
  gem "faker"
end
