class ApplicationSerializer < ActiveModel::Serializer
  def json_key
    "data"
  end
end
