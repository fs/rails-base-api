module NullAttributesRemover
  extend ActiveSupport::Concern

  def serializable_hash(adapter_options, options, adapter_instance)
    super.tap do |hash|
      hash.each { |key, value| hash.delete(key) if value.nil? }
    end
  end
end
