class SessionsController < Devise::SessionsController
  wrap_parameters :user
  skip_before_action :skip_trackable

  def create
    user = AuthenticateUser.perform(warden: warden).user
    render json: user
  end
end
