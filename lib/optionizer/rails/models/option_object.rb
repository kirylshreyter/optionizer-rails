module Optionizer
  module Rails
    class OptionObject < BaseModel
      attr_accessor :content

      def initialize
        @content = {}
      end

      def fields
        @content.keys
      end

      def values
        @content.values
      end

      def value(field)
        @content[field.to_s] || @content[field.to_sym]
      end

      def put(field, value)
        @content[field] = value
      end

      def state
        { type: type,
          options: @content.each_with_object({}) { |(field, value), memo| memo[field] = value.state } }
      end

      def type
        :object
      end
    end
  end
end
