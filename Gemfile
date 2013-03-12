source 'https://rubygems.org'

gem 'rails', '3.2.12'

gem 'rails-api'

gem 'pg'
gem 'airbrake'
gem 'thin'
gem 'decent_exposure'
gem 'active_model_serializers'
gem 'seedbank'
gem 'dotenv'

group :development do
  gem 'letter_opener'
  gem 'foreman'
  gem 'bullet'
end

group :development, :test do
  gem 'debugger'
  gem 'rspec-rails'
  gem 'mail_safe'
  gem 'rails_best_practices'
  gem 'brakeman'
end

group :test do
  gem 'simplecov', require: false
  gem 'webmock', require: false

  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'shoulda-matchers'
end

group :development, :staging do
  gem 'api_taster'
end

group :development, :test, :staging do
  gem 'faker'
  gem 'factory_girl_rails'
end
