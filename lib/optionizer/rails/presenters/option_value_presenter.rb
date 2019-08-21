module Optionizer
  module Rails
    class OptionValuePresenter < BasePresenter
      def display
        option_div(simple_value) do
          concat(change_button(simple_value))
          concat(delete_button)
          concat(hidden_input_div(simple_value, simple_value))
        end
      end
    end
  end
end
