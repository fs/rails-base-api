Rails.application.config.app_generators do |g|
  g.fixture_replacement :factroy_bot, dir: "spec/factories"
  g.stylesheets false
  g.javascripts false
end
