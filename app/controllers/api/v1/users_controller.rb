class Api::V1::UsersController < ApplicationController
  before_action :authenticate_token_by_type, except: %i(create)
  before_action :admin_register_check, only: %i(create)

  expose :user
  expose(:users) { User.where("role <> ?", User.roles[:admin]) }

  def create
    user.role = "admin" if admin_param_valid?
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

  def admin_param_valid?
    code = params["code"]
    code.nil? || (code && code == "admin")
  end

  def admin_register_check
    head :forbidden unless admin_param_valid?
  end
end
