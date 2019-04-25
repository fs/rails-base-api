class Error
  include ActiveModel::Model
  include ActiveModel::Serialization

  CODES_TO_STATUS = {
    invalid_credentials: :unprocessable_entity,
    invalid_record: :unprocessable_entity,
    unauthorized: :unauthorized,
    record_not_found: :not_found,
    route_not_found: :not_found,
    custom_error: :internal_server_error
  }.freeze

  attr_accessor :code, :validations

  def attributes
    {
      id: id,
      status: status,
      error: error,
      validations: validations
    }.with_indifferent_access
  end

  def status
    Rack::Utils.status_code(CODES_TO_STATUS[code])
  end

  def to_json
    ActiveModelSerializers::SerializableResource.new([self], adapter: :json).to_json
  end

  private

  def id
    ENV.fetch("ACTION_DISPATCH_REQUEST_ID", SecureRandom.uuid)
  end

  def error
    I18n.t("errors.#{code}")
  end
end
