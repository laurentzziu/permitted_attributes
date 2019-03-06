# frozen_string_literal: true

module PermittedAttributes
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def permitted_attributes
      return [] unless respond_to?(:column_names)

      (column_names || []).map(&:to_sym) - attributes_to_exclude
    end

    def excluded_attributes(*attrs, skip_defaults: false)
      @excluded_attributes = *attrs
      @skip_defaults = skip_defaults
    end

    private

    DEFAULT_EXCLUDED_ATTRIBUTES = %i[id created_at updated_at].freeze

    def attributes_to_exclude
      @excluded_attributes ||= []

      results = if @skip_defaults
                  @excluded_attributes
                else
                  @excluded_attributes + DEFAULT_EXCLUDED_ATTRIBUTES
                end

      results.uniq
    end
  end
end
