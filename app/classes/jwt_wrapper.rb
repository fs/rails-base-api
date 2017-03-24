class JWTWrapper
  def self.encode(payload, expiration = nil)
    expiration ||= Rails.application.secrets.jwt_expiration_hours
    payload = payload.dup
    payload["exp"] = expiration.to_i.hours.from_now.to_i

    JWT.encode(payload, PRIVATE_KEY, "RS256")
  end

  def self.decode(token)
    decoded_token = JWT.decode(token, PUBLIC_KEY, true, algorithm: "RS256")
    HashWithIndifferentAccess.new(decoded_token.first)
  end
end
