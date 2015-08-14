module RailsApiFormat
  class Responder < ActionController::Responder
    def api_behavior
      fail MissingRenderer.new(format), "No renderer defined for format: #{format}" unless has_renderer?

      if post?
        display(resource, status: :created)
      else
        display(resource, status: :ok)
      end
    end

    def json_resource_errors
      Error.new(status: :unprocessable_entity, validations: resource.errors)
    end
  end
end
