class SessionsController < Devise::SessionsController
  wrap_parameters :user

  skip_before_filter :skip_trackable

  def create
    user = AuthenticateUser.perform(warden: warden).user
    respond_with(user)
  end
end
