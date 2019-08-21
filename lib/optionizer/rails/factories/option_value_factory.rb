module Optionizer
  module Rails
    class OptionValueFactory
      include Singleton

      def get_option_value(type)
        if type.is_a?(Numeric)
          NumericValue.new(type)
        elsif type.is_a?(String)
          StringValue.new(type)
        elsif type.is_a?(Symbol)
          SymbolValue.new(type)
        elsif type.is_a?(NilClass)
          NilValue.new
        elsif type.is_a?(TrueClass) || type.is_a?(FalseClass)
          BooleanValue.new(type)
        else
          raise NotImplementedError
        end
      end
    end
  end
end
