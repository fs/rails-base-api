module JSONAPI
  class Responder < ActionController::Responder
    include Responders::HttpCacheResponder

    def api_behavior
      fail MissingRenderer.new(format) unless format == :api_json

      case
      when post?
        display resource, status: :created
      when patch? || put?
        display resource, status: :accepted
      else
        display resource
      end
    end

    def display(resource, given_options = {})
      controller.jsonapi_render(given_options.merge!(json: resource))
    end

    def display_errors
      controller.jsonapi_render_errors(json: resource)
    end
  end
end
