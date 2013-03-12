Rails.application.config.after_initialize do
  Bullet.enable = true
  Bullet.alert = true
  Bullet.rails_logger = true
  Bullet.console = true
  Bullet.airbrake = true
end if defined?(Bullet)
