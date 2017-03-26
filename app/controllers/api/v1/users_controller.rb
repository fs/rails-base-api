class Api::V1::UsersController < ApplicationController
  before_action :authenticate_token_by_type, except: %i(create)
  before_action :admin_register_check, only: %i(create)

  expose :user
  expose(:users) { User.where("role <> ?", User.roles[:admin]) }

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

  def admin_register_check
    code = params["code"]
    return if code.nil?
    return head :forbidden unless code == "admin"
    user.role = "admin"
  end
end
