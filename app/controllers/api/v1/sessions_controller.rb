class Api::V1::SessionsController < ApplicationController
  def create
    result = AuthenticateUser.call(session_params)
    if result.success?
      render json: result.token
    else
      head :unauthorized
    end
  end

  private

  def session_params
    params.permit(:username, :password)
  end
end
