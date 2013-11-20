SimpleCov.start 'rails' do
  add_filter 'api_taster'
  add_filter 'examples'
  add_filter 'serializers'
  add_filter '.bundle'
  add_filter 'vendor/bundle'
end
