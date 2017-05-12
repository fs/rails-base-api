module Helpers
  def setup_devise_mapping(mapping_name = :user)
    @request.env["devise.mapping"] = Devise.mappings[mapping_name]
  end

  def json_response_body
    parse_json(response_body)
  end

  def json_response_data
    parse_json_data(response_body)
  end

  def parse_json_data(json)
    parse_json(json)["data"]
  end
end
