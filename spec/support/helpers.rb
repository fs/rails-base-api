module Helpers
  def setup_devise_mapping(mapping_name = :user)
    @request.env['devise.mapping'] = Devise.mappings[mapping_name]
  end

  def json_response_body
    # TODO: rewrite after remove spec/api
    # JSON.parse(response_body)
    respond_to?(:response) ? parse_json(response.body) : parse_json(response_body)
  end
end
