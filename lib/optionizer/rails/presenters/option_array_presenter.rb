module Optionizer
  module Rails
    class OptionArrayPresenter < BasePresenter
      attr_accessor :root

      def with_root(root)
        @root = root
        self
      end

      def display
        @root.present? ? root_div(@root) { display_values } : array_div { display_values }
      end

      private

      def display_values
        values.each { |value| concat(value.presenter.display) }
      end
    end
  end
end
