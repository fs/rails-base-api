class JWTPayload
  def self.payload_for(user, type: Token::TYPES[:access], expiration: nil)
    expiration ||= Rails.application.secrets.jwt_expiration_hours
    {
      sub: user.id,
      type: type,
      iat: Time.now.to_i,
      iss: "Demo jwt",
      exp: expiration.to_i.hours.from_now.to_i
    }
  end
end
