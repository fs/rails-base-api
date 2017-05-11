require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBaseApi
  class Application < Rails::Application
    config.api_only = true

    LIBRARY_PATH = Rails.root.join("lib")
    config.autoload_paths << LIBRARY_PATH.to_s

    # Default e-mail address which will be shown in the "from" devise emails, initializers/devise.rb.
    config.noreply = "noreply@fs-rails-base-api.heroku.com"

    # Default host for action mailer, initializers/mailer.rb
    config.host = "localhost:5000"

    config.public_file_server.enabled = false

    # Disable default Rails headers which do not make sense in
    # API-only project (X-Frame-Options, X-XSS-Protection, X-Content-Type-Options)
    config.action_dispatch.default_headers = {}
  end
end
