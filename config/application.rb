require File.expand_path("../boot", __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBaseApi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Default e-mail address which will be shown in the "from" devise emails, initializers/devise.rb.
    config.noreply = "noreply@fs-rails-base-api.heroku.com"

    # Default host for action mailer, initializers/mailer.rb
    config.host = "localhost:5000"

    config.serve_static_files = false

    # Disable default Rails headers which do not make sense in
    # API-only project (X-Frame-Options, X-XSS-Protection, X-Content-Type-Options)
    config.action_dispatch.default_headers = {}
  end
end
