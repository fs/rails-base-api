Devise.setup do |config|
  config.secret_key = '61fd7cfadc48946c3bfabbd6b54eb50de2bbe1fdc1b0cf3aee9786646bbab5ebf88da27560a55e380ec1218bf3d2b881d0641eea4ce3c36388f4442b9a3a102d'
  
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
