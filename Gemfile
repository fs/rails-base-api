source 'https://rubygems.org'

ruby '2.2.2'

# the most important stuff
gem 'rails', '4.2.3'
gem 'pg'
gem 'rails-api'

# all other gems
gem 'active_model_serializers', '~> 0.8.3'
gem 'decent_exposure'
gem 'devise'
gem 'dotenv-rails'
gem 'interactor-rails'
gem 'kaminari'
gem 'rack-cors', require: 'rack/cors'
gem 'responders'
gem 'seedbank'
gem 'thin'

group :development do
  gem 'letter_opener'
  gem 'foreman'
  gem 'bullet'

  gem 'guard-rspec'
  gem 'rb-fsevent', require: false
  gem 'zeus'
end

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'mail_safe'

  gem 'rails_best_practices'
  gem 'brakeman'
  gem 'rubocop'
  gem 'bundler-audit'
end

group :test do
  gem 'simplecov', require: false
  gem 'webmock', require: false

  gem 'database_cleaner'
  gem 'email_spec'
  gem 'shoulda-matchers'
  gem 'json_spec'
end

group :development, :test, :staging do
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'rspec_api_documentation'
  gem 'apitome'
end

group :staging, :production do
  gem 'rollbar'
  gem 'rails_12factor'
end
