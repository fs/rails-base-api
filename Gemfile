source 'https://rubygems.org'

ruby '2.1.2'

# the most important stuff
gem 'rails', '4.1.11'
gem 'pg'
# https://github.com/rails-api/rails-api/issues/135
gem 'rails-api', git: 'https://github.com/fs/rails-api.git'

# all other gems
gem 'thin'
gem 'decent_exposure'
gem 'seedbank'
gem 'devise'
gem 'kaminari'
gem 'dotenv-rails'
gem 'active_model_serializers'
gem 'interactor-rails'
gem 'rack-cors', require: 'rack/cors'

group :development do
  gem 'letter_opener'
  gem 'foreman'
  gem 'bullet'

  gem 'guard-rspec'
  gem 'rb-fsevent', require: false
  gem 'zeus'
end

group :development, :test do
  # FIXME: Required for fixing warning
  # https://github.com/rspec/rspec-rails/pull/772
  # Going to be fixed in rspec > 2.99
  #
  gem 'minitest'
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0.0'
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
  gem 'rspec_api_documentation', '~> 4.0.0'
  gem 'apitome'
end

group :staging, :production do
  gem 'rollbar'
  gem 'rails_12factor'
end
