module RailsApiFormat
  class RailsPublicExceptions < ActionDispatch::PublicExceptions
    def call(env)
      status       = env['PATH_INFO'][1..-1]
      request      = ActionDispatch::Request.new(env)
      content_type = request.formats.first
      error        = Rack::Utils::HTTP_STATUS_CODES.fetch(status.to_i, Rack::Utils::HTTP_STATUS_CODES[500])
      body         = Error.new(status: status, error: error)

      render(status, content_type, body)
    end
  end
end
