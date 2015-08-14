require 'rails_api_format/railtie'

module RailsApiFormat
  extend ::ActiveSupport::Autoload

  autoload :Error
  autoload :ErrorSerializer
  autoload :DeviseFailureApp
  autoload :RailsPublicExceptions
  autoload :Responder
  autoload :Matchers
end
