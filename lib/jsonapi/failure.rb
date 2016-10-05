module JSONAPI
  class AuthenticationError < JSONAPI::Exceptions::Error
    def self.code
      "401"
    end

    def self.errors
      [JSONAPI::Error.new(
        code: code,
        status: :unauthorized,
        title: "Unauthorized",
        detail: "You need to sign in or sign up before continuing")]
    end
  end

  class Failure < Devise::FailureApp
    include JSONAPI::Utils::Response::Formatters

    def respond
      self.status = :unauthorized
      self.content_type = JSONAPI::MEDIA_TYPE
      self.response_body = {
        errors: jsonapi_format_errors(AuthenticationError)
      }.to_json
    end
  end
end
