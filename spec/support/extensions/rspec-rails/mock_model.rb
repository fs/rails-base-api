module RSpec
  module Rails
    module Mocks
      def mock_model_with_read_attribute_for_serialization(string_or_model_class, stubs = {})
        stubs = stubs.update(read_attribute_for_serialization: 'attribute')

        mock_model_without_read_attribute_for_serialization(
          string_or_model_class,
          stubs
        )
      end

      alias_method_chain :mock_model, :read_attribute_for_serialization
    end
  end
end
