module Helpers
  def set_devise_mapping(mapping_name = :user)
    @request.env['devise.mapping'] = Devise.mappings[mapping_name]
  end

  def json_response_body
    JSON.parse(response.body)
  end
end
