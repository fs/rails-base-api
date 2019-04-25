module ResponseHelpers
  def json_response_body
    JSON.parse(response_body)
  end
end

RSpec.configure do |config|
  config.include ResponseHelpers
end
