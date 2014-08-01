if ENV['APITOME_USER'] && ENV['APITOME_PASSWORD']
  Apitome::DocsController.before_action :http_authentication, only: [:index]

  class Apitome::DocsController
    private
    def http_authentication
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['APITOME_USER'] && password == ENV['APITOME_PASSWORD']
      end
    end
  end
end
