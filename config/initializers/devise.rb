Devise.setup do |config|
  config.mailer_sender = app_config.noreply

  require "devise/orm/active_record"

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.warden do |manager|
    manager.strategies.add(:jwt, Devise::Strategies::JsonWebToken)
    manager.default_strategies(scope: :user).unshift :jwt
  end
end
