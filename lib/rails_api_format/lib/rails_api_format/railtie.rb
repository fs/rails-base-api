module RailsApiFormat
  class Railtie < ::Rails::Railtie
    initializer "rails_api_format.exceptions_app" do |app|
      app.config.exceptions_app = RailsPublicExceptions.new(Rails.public_path)
    end

    initializer "rails_api_format.devise" do
      Devise.setup do |config|
        config.warden do |manager|
          manager.failure_app = DeviseFailureApp
        end
      end
    end

    initializer "rails_api_format.responder" do
      ActionController::API.responder = Responder
    end
  end
end
