class Error
  include ActiveModel::Model
  include ActiveModel::Serialization

  CODES_TO_STATUS = {
    invalid_credentials: :unprocessable_entity,
    unauthorized: :unauthorized,
    record_not_found: :not_found,
    route_not_found: :not_found,
    custom_error: :internal_server_error
  }.freeze

  attr_accessor :code

  def attributes
    {
      code: code,
      detail: detail
    }
  end

  def detail
    I18n.t("errors.#{code}")
  end

  def status
    CODES_TO_STATUS[code]
  end

  def to_json
    ActiveModelSerializers::SerializableResource.new([self], adapter: :json).to_json
  end
end
