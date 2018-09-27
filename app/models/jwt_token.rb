class JwtToken < Knock::AuthToken
  include ActiveModel::Serialization

  def id
    token
  end
end
