class Api::V1::UsersController < ApplicationController
  before_action :authenticate_token_by_type, except: %i(create)

  expose :user
  expose(:users) { User.all }

  def create
    if user.save
      head :created
    else
      respond_with :v1, user
    end
  end

  def show
    render json: user
  end

  def index
    render json: users
  end

  def update
    user.update_attributes(user_params)
    respond_with :v1, user
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
