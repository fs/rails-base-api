app_config.middleware.use Rack::Cors do
  allow do
    # Allow requests from domains:
    # e.g. origins('api.example.com', 'next.example.com')
    #
    origins app_config.allow_requests_from

    resource(
      '*',
      headers: :any,
      methods: [:get, :post, :put, :delete, :patch, :options]
    )
  end
end
