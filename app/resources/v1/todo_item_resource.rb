module V1
  class TodoItemResource < V1::ApplicationResource
    NON_UPDATED_FIELDS = %i(created_at updated_at).freeze

    attributes :title, :text, :created_at, :updated_at

    has_one :user

    def self.updateable_fields(_context)
      super - NON_UPDATED_FIELDS
    end

    def self.createable_fields(_context)
      super - NON_UPDATED_FIELDS
    end
  end
end
