class Api::V1::TokensController < ApplicationController
  before_action do
    authenticate_token_by_type Token::TYPES[:refresh]
  end

  def refresh
    payload = JWTPayload.payload_for(current_user)
    auth_token = JWTWrapper.encode(payload)
    token = Token.new(auth_token, http_token)
    render json: token
  end
end
