class Auth
  include Interactor

  delegate :email, :password, to: :context

  def call
    user = User.find_by(email: email)
    user&.valid_password?(password) || context.fail!
    context.user = user
  end
end
