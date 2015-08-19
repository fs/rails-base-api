if defined? Rollbar
  require "rollbar/rails"

  Rollbar.configure do |config|
    config.access_token = ENV["ROLLBAR_ACCESS_TOKEN"]

    # Ignoring 404 errors
    config.exception_level_filters.merge!("ActionController::RoutingError" => "ignore",
                                          "AbstractController::ActionNotFound" => "ignore")
  end
end
