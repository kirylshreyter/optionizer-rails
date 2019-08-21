module Optionizer
  module Rails
    class OptionValue < BaseModel
      include Shared::Presentable
      include Shared::SimpleValue
      include Shared::Parentable

      def initialize(value)
        @value = value
      end

      def state
        { value: @value, type: type }
      end

      def type
        if @value.is_a?(TrueClass) || @value.is_a?(FalseClass)
          :boolean
        elsif @value.is_a?(NilClass)
          :nil
        elsif @value.is_a?(Numeric)
          :numeric
        elsif @value.is_a?(String)
          :string
        elsif @value.is_a?(Symbol)
          :symbol
        else
          raise NotImplementedError
        end
      end
    end
  end
end
