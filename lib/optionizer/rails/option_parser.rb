module Optionizer
  module Rails
    class OptionParser
      def make_option_object(object, option_object, level, parent)
        option_object.level = level + 1
        option_object.parent = parent
        object.each_pair do |field, value|
          option_object.put(field, determine_type(value, option_object.level + 1, option_object))
        end
        option_object
      end

      def make_option_array(array, result, level, parent)
        array.each { |entry| result.add(determine_type(entry, level, parent)) }
        result
      end

      private

      def determine_type(entry, level, parent)
        if entry.is_a?(Hash)
          make_option_object(entry, OptionObject.new, level, parent)
        elsif entry.is_a?(Array)
          make_option_array(entry, OptionArray.new, level, parent)
        else
          OptionValueFactory.instance.get_option_value(entry).tap { |value|  value.parent = parent }
        end
      end
    end
  end
end
