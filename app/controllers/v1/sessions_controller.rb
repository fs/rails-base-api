module V1
  class SessionsController < Devise::SessionsController
    wrap_parameters :user

    def create
      user = AuthenticateUser.call(warden: warden).user
      respond_with(user)
    end
  end
end
