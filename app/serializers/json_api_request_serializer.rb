params = {
  type: "token",
  email: "me@timurv.ru",
  password: "123456"
}

attributes = params.keys

request_class = ActiveModel::Name.new(nil, nil, "token_request") do
  include ActiveModel::Serialization

  attributes(*attributes)
end

request = request_class.new(params)

serializer_class = Class.new(ActiveModel::Serializer) do
  attributes(*attributes)
end

json = ActiveModelSerializers::SerializableResource.new(request, serializer: serializer_class).to_json
