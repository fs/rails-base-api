class JWTWrapper
  def self.encode(payload)
    JWT.encode(payload, RSA_PRIVATE_KEY, "RS256")
  end

  def self.decode(token)
    decoded_token = JWT.decode(token, RSA_PUBLIC_KEY, true, algorithm: "RS256")
    HashWithIndifferentAccess.new(decoded_token.first)
  end
end
