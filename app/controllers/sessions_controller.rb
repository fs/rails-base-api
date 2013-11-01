class SessionsController < Devise::SessionsController
  wrap_parameters :user

  def create
    user = AuthenticateUser.perform(warden: warden).user
    respond_with(user)
  end
end
