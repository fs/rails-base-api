require 'rollbar/rails'

Rollbar.configure do |config|
  config.access_token = ENV['ROLLBAR_ACCESS_TOKEN']

  # Disable in test and development envs
  if Rails.env.test? || Rails.env.development?
    config.enabled = false
  end

  # Ignoring 404 errors
  config.exception_level_filters.merge!({
    'ActionController::RoutingError' => 'ignore',
    'AbstractController::ActionNotFound' => 'ignore'
  })
end
