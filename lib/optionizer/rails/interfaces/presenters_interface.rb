module Optionizer
  module Rails
    module PresentersInterface
      def presenter_for(type)
        yield(type.presenter)
      end
    end
  end
end
