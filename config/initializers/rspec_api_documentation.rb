RspecApiDocumentation.configure do |config|
  config.format = :json
  config.docs_dir = Rails.root.join("doc", "api", "v1")
  config.request_headers_to_include = %w(Accept X-User-Token X-User-Email Content-Type)
  config.response_headers_to_include = %w(Content-Type)
  config.curl_host = "https://timebox-api.herokuapp.com"
  config.curl_headers_to_filter = %w(Cookie Host Origin)
  config.request_body_formatter = :json
  config.keep_source_order = true
end if defined? RspecApiDocumentation
