module Optionizer
  module Rails
    class OptionManager
      def initialize
        @parser = OptionParser.new
      end

      def parse(object)
        OptionArray.new.tap do |result|
          result.level = 0
          if object.is_a?(Hash)
            result.add(@parser.make_option_object(object, OptionObject.new, result.level + 1, result ))
          else
            parser.make_option_array(object, result, result.level + 1, result)
          end
        end
      end
    end
  end
end
