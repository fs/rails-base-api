app_config.middleware.use Rack::Cors do
  allow do
    # Allow requests from domains:
    # e.g. origins('api.example.com', 'next.example.com')
    #
    origins(*ENV.fetch('ALLOW_REQUESTS_FROM', app_config.host).split(','))

    resource(
      '*',
      headers: :any,
      methods: [:get, :post, :put, :delete, :patch, :options]
    )
  end
end
