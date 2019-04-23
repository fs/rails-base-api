class CreateJwt
  include Interactor

  delegate :email, :password, to: :context
  delegate :token, to: :jwt_token

  def call
    context.fail!(error) unless authenticated?
    context.token = token
  end

  private

  def authenticated?
    user.present? && user.authenticate(password)
  end

  def jwt_token
    JwtToken.new(payload: { sub: user.id })
  end

  def user
    @user ||= User.find_by(email: email)
  end

  def error
    {
      code: :unprocessable_entity,
      message: "Invalid credentials"
    }
  end
end
