class ApiResponder < ActionController::Responder
  def api_behavior
    if get?
      display resource
    elsif post?
      display resource, status: :created
    elsif put? || patch? || delete?
      display resource, status: :ok
    end
  end
end
