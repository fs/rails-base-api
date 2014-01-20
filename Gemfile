source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'rails-api'

gem 'pg'
gem 'rollbar'
gem 'thin'
gem 'decent_exposure'
gem 'active_model_serializers'
gem 'interactor-rails'
gem 'seedbank', github: 'james2m/seedbank'
gem 'dotenv-rails'
gem 'devise', '~> 3.1.0'

group :development do
  gem 'letter_opener'
  gem 'foreman'
  gem 'bullet'

  gem 'guard-rspec'
  gem 'rb-fsevent', require: false
  gem 'zeus'
end

group :development, :test do
  gem 'byebug', '~> 1.8.2'
  gem 'rspec-rails'
  gem 'mail_safe'

  gem 'rails_best_practices'
  gem 'brakeman'
  gem 'rubocop'
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
  gem 'api_taster', github: 'fs/api_taster'
end

group :development, :test, :staging do
  gem 'faker'
  gem 'factory_girl_rails'
end

group :staging do
  gem 'sass-rails'
  gem 'uglifier'
  gem 'coffee-rails'
end

group :staging, :production do
  gem 'rails_12factor'
end
