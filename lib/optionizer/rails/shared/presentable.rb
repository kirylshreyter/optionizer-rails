module Optionizer
  module Rails
    module Shared
      module Presentable
        def presenter
          PresenterFactory.instance.get_presenter(self)
        end
      end
    end
  end
end
