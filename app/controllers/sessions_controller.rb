class SessionsController < Devise::SessionsController
  wrap_parameters :user,
    include: [:email, :password]

  def create
    user = AuthenticationService.new(warden).authenticate!

    respond_with(
      user,
      location: false
    )
  end

  private

  # def params
  #   super.require(:user).permit(:email, :password)
  # end
end
