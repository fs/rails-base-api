class SessionsController < Devise::SessionsController
  wrap_parameters :user

  def create
    user = AuthenticationService.new(warden).authenticate!

    respond_with(
      user,
      location: root_url
    )
  end
end
