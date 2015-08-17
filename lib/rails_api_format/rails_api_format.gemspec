$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'rails_api_format/version'

Gem::Specification.new do |s|
  s.name        = 'rails_api_format'
  s.version     = RailsApiFormat::VERSION
  s.authors     = ['Timur Vafin']
  s.email       = ['timur.vafin@flatstack.com']
  s.homepage    = 'https://github.com/fs/rails-base-api'
  s.summary     = 'Rails API Format'
  s.description = 'Rails API Format'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.2.3'
  s.add_dependency 'active_model_serializers', '~> 0.10.0.rc2'
  s.add_dependency 'devise', '~> 3.5.1'
  s.add_dependency 'responders', '~> 2.1.0'
end
