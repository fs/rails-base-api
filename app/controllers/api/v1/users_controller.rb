class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user, except: %i(create)
  before_action :admin_register_check, only: %i(create)

  expose :user
  expose(:users) { User.where("role <> ?", User.roles[:admin]) }

  def create
    user.role = "admin" if params["code"] == "admin"
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

  private

  def user_params
    params.permit(:username, :password)
  end

  def admin_register_check
    head :forbidden if params["code"] && params["code"] != "admin" 
  end
end
