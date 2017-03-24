class Api::V1::TokensController < ApplicationController
  before_action :authenticate_user

  def refresh
    token = RefreshToken.call(user: current_user, http_token: http_token).token
    render json: token
  end
end
