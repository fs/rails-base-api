class ApiResponder < ActionController::Responder
  def api_behavior
    if post?
      display resource, status: :created
    else
      display resource, status: :ok
    end
  end

  def json_resource_errors
    Error.new(code: :invalid_record, validations: resource.errors.messages)
  end
end
