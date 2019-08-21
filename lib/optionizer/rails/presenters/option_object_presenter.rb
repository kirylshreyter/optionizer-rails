module Optionizer
  module Rails
    class OptionObjectPresenter < BasePresenter
      def display
        object_div { display_content }
      end

      private

      def display_content
        content.each_pair { |label, value| concat(group_div(label_div(label), value.presenter.display)) }
      end
    end
  end
end
