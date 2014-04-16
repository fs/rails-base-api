RspecApiDocumentation.configure do |config|
  config.format = :json
  config.docs_dir = Rails.root.join('doc', 'api')
end if defined? RspecApiDocumentation
