require "rspec_api_documentation"
require "rspec_api_documentation/dsl"

# rubocop:disable Style/WordArray
RspecApiDocumentation.configure do |config|
  config.format = :markdown
  config.docs_dir = Rails.root.join("doc", "api", "v1")
  config.request_headers_to_include = ["Accept", "Content-Type", "Authorization"]
  config.response_headers_to_include = ["Content-Type"]
  config.curl_host = "http://#{ENV.fetch('HOST')}"
  config.curl_headers_to_filter = ["Cookie", "Host", "Origin"]
  config.keep_source_order = true
end
# rubocop:enable Style/WordArray
