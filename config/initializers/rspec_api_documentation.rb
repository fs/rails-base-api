RspecApiDocumentation.configure do |config|
  config.format = :json
  config.docs_dir = Rails.root.join('public', 'doc', 'api')
end if defined? RspecApiDocumentation
