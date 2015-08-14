module RailsApiFormat
  class Responder < ActionController::Responder
    def api_behavior
      fail MissingRenderer.new(format), "No renderer defined for format: #{format}" unless has_renderer?

      if get?
        display resource
      elsif post?
        display resource, status: :created, location: nil
      else
        head :no_content
      end
    end

    def json_resource_errors
      Error.new(status: :unprocessable_entity, validations: resource.errors)
    end
  end
end
