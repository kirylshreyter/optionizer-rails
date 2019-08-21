module Optionizer
  module Rails
    class OptionArray < BaseModel
      def initialize
        @content = []
      end

      def values
        @content
      end

      def get(index)
        @content[index]
      end

      def add(object)
        @content << object
      end

      def state
        { options: values.each_with_object([]) { |value, memo| memo << value.state }, type: type }
      end

      def type
        :array
      end
    end
  end
end
