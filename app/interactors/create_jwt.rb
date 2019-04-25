class CreateJwt
  include Interactor

  delegate :email, :password, to: :context

  def call
    context.fail!(error) unless authenticated?
    context.jwt_token = jwt_token
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
      message: I18n.t("errors.invalid_credentials")
    }
  end
end
