class Token
  include ActiveModel::Serializers::JSON

  TYPES = { access: "access", refresh: "refresh" }.freeze

  attr_reader :auth_token, :refresh_token

  def initialize(auth_token, refresh_token = nil)
    @auth_token = auth_token
    @refresh_token = refresh_token
  end

  def self.refresh_for(user)
    payload = JWTPayload.payload_for(user)
    auth_token = JWTWrapper.encode(payload)
    new(auth_token)
  end
end
