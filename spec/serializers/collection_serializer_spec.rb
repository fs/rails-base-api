require 'rails_helper'

describe CollectionSerializer do
  let(:users) { create_list :user, 3 }

  let(:json) { CollectionSerializer.new(users, root: :users).to_json }
  let(:users_json) { parse_json(json) }

  let(:meta) do
    {
      'pagination' =>
      {
        'total' => 3,
        'per_page' => 25,
        'page' => 1
      }
    }
  end

  before do
    users.stub(total_count: 3, limit_value: 25, current_page: 1)
  end

  it 'returns correct users' do
    users_json['users'].each_with_index do |user_json, index|
      expect(user_json).to be_a_user_representation(users[index])
    end

    expect(users_json['meta']).to eql(meta)
  end
end
