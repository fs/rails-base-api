class ApiResponder < ActionController::Responder
  def api_behavior
    fail MissingRenderer.new(format), "No renderer defined for format: #{format}" unless has_renderer?

    if post?
      display(resource, status: :created, location: options[:location])
    else
      display(resource, status: :ok, location: options[:location])
    end
  end
end
