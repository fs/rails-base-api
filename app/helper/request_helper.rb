module RequestHelper
  def http_token
    @http_token ||=
      if request.headers["Authorization"].present?
        request.headers["Authorization"].split(" ").last
      end
  end

  def auth_token
    @auth_token ||= JWTWrapper.decode(http_token)
  end

  def sub_in_token?
    http_token && auth_token && auth_token[:sub]
  end

  def valid_token_type?(type)
    auth_token[:type] && auth_token[:type] == type
  end

  def token_valid_for?(type)
    sub_in_token? && valid_token_type?(type)
  end
end
