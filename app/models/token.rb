class Token
  include ActiveModel::Serializers::JSON

  attr_reader :auth_token, :refresh_token

  def initialize(auth_token, refresh_token)
    @auth_token = auth_token
    @refresh_token = refresh_token
  end
end
