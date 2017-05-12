module TokenClaims
  extend ActiveSupport::Concern

  def claims
    strategy, token = request.headers["Authorization"].split(" ")
    retun nil unless (strategy || "").casecmp("bearer")
    ::JWTWrapper.decode(token)
  end
end
