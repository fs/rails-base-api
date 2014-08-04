RspecApiDocumentation.configure do |config|
  config.format = :json
  config.docs_dir = Rails.root.join('doc', 'api', 'v1')
  config.request_headers_to_include = ['Accept']
  config.curl_host = "http://#{app_config.host}"
  config.curl_headers_to_filter = ['Cookie', 'Host', 'Content-Type']
  config.keep_source_order = true
end if defined? RspecApiDocumentation
