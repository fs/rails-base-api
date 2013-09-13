source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'rails-api'

gem 'pg'
gem 'airbrake'
gem 'thin'
gem 'decent_exposure'
gem 'active_model_serializers'
gem 'seedbank', github: 'james2m/seedbank'
gem 'dotenv'
gem 'devise', '~> 3.1.0'
gem 'rails_12factor', group: [:production, :staging]

group :development do
  gem 'letter_opener'
  gem 'foreman'
  gem 'bullet'

  gem 'guard-rspec'
  gem 'rb-fsevent', require: false
  gem 'zeus'
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
  gem 'api_taster', github: 'vast/api_taster', branch: 'rails4'
  # gem 'api_taster', path: '../api_taster' # for local development
end

group :development, :test, :staging do
  gem 'faker'
  gem 'factory_girl_rails'
end
