require 'active_support/concern'

module ActiveModel::Serializer::IncludeOnlyDeclaredAssociations
  extend ActiveSupport::Concern

  included do
    alias_method_chain :include_associations!, :only_declared_associations
  end

  private

  def include_associations_with_only_declared_associations!
    include_only_declared_associations!
  end

  def include_only_declared_associations!
    associations_inclusion_options.each do |association|
      include!(association)
    end if has_associations_inclusion_options?
  end

  def has_associations_inclusion_options?
    options.include?(:serializer_includes) &&
      associations_inclusion_options.present?
  end

  def associations_inclusion_options
    options[:serializer_includes][current_serializer]
  end

  def current_serializer
    self.class.name.demodulize.underscore.sub(/_serializer$/, '').to_sym
  end
end

ActiveModel::Serializer.send(:include, ActiveModel::Serializer::IncludeOnlyDeclaredAssociations)
