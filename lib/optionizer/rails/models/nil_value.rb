module Optionizer
  module Rails
    class NilValue < OptionValue
      def initialize
        @value = nil
      end
    end
  end
end

