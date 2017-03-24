class Api::V1::AdminsController < ApplicationController
  before_action :authenticate_user
  before_action :current_user_admin?

  expose(:admins) { User.where("role = ?", User.roles[:admin]) }

  def index
    render json: admins
  end

  private

  def current_user_admin?
    head :forbidden unless current_user.admin?
  end
end
