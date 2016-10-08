module Helpers
  def setup_devise_mapping(mapping_name = :user)
    @request.env["devise.mapping"] = Devise.mappings[mapping_name]
  end

  def json_response_body
    parse_json response_body
  end

  def response_data
    response["data"]
  end

  def response_attrs
    return response_data["attributes"] unless response_data.is_a?(Array)

    response_data.map { |d| d["attributes"] }
  end

  def response_status_code
    Rack::Utils::HTTP_STATUS_CODES[response_status].parameterize("_").to_sym
  end

  def jsonapi_params(type, attributes, id = nil)
    params = {
      data: {
        type: type,
        attributes: attributes
      }
    }

    params[:data][:id] = id if id
    params
  end
end
