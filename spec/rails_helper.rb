# Do not run simplecov on CI
unless ENV['CI']
  require 'simplecov'
  SimpleCov.start 'rails'
end

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
# require 'rspec/autorun' should be disabled with guard

paths = Dir[Rails.root.join('spec/**/{support,extensions}/**/*.rb')]
paths.each { |file| require file }

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
  config.include Devise::TestHelpers, type: :controller
  config.include FactoryGirl::Syntax::Methods
  config.include Helpers
  config.include JsonSpec::Helpers
end
