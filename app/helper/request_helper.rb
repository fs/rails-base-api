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

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end
end
