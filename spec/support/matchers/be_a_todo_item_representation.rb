RSpec::Matchers.define :be_a_todo_item_representation do |item|
  match do |json|
    expect(json).to be
    expect(json["attributes"]["title"]).to eq(item.title)
    expect(json["attributes"]["text"]).to eq(item.text)
  end
end
