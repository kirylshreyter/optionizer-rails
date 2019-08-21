module Optionizer
  module Rails
    module OptionHelper
      include PresentersInterface

      def show_options(root_element, options = {})
        render(template: 'options', locals: { root: root_element, options: OptionManager.new.parse(options) })
      end
    end
  end
end
