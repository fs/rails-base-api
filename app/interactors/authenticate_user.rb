class AuthenticateUser
  include Interactor

  OPTIONS = { store: false, scope: :user }

  def perform
    context[:user] = authenticated_user
  end

  private

  def authenticated_user
    warden.authenticate!(OPTIONS).tap(&:ensure_authentication_token!)
  end
end
