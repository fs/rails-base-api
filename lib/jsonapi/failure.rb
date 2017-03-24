module JSONAPI
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
