RailsBaseApi::Application.configure do
  config.generators do |g|
    g.fixture_replacement :factory_girl, dir: 'spec/factories'
    g.stylesheets false
    g.javascripts false
  end
end
