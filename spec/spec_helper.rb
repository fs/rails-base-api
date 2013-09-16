require 'simplecov'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
# require 'rspec/autorun' should be disabled with guard

paths = Dir[Rails.root.join('spec/**/{support,extensions}/**/*.rb')]
paths.each { |file| require file }

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.include Rails.application.routes.url_helpers
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
  config.include Devise::TestHelpers, type: :controller
  config.include Helpers

  config.infer_base_class_for_anonymous_controllers = false

  config.order = 'random'

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before do
    ActionMailer::Base.deliveries.clear
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Make sure we will send all requests with correct content type
  #
  config.before(type: :controller) do
    request.env['CONTENT_TYPE'] = 'application/json'
  end
end
