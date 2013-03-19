class AuthenticationService
  SCOPE = :user

  def initialize(warden)
    @warden = warden
  end

  def authenticate!
    @warden.authenticate!(authentication_options).tap do |user|
      user.ensure_authentication_token!
    end
  end

  private

  def authentication_options
    { store: false, scope: SCOPE }
  end
end
