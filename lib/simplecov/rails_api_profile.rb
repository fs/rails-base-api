require 'simplecov'
SimpleCov.adapters.define 'rails-api' do
  load_adapter 'rails'
  add_filter 'api_taster'
  add_filter 'examples'
  add_filter 'serializers/'
end
