module Optionizer
  module Rails
    class PresenterFactory
      include Singleton

      def get_presenter(type)
        if type.is_a?(BooleanValue)
          BooleanValuePresenter.new(type)
        elsif type.is_a?(NilValue)
          NilValuePresenter.new(type)
        elsif type.is_a?(NumericValue)
          NumericValuePresenter.new(type)
        elsif type.is_a?(StringValue)
          StringValuePresenter.new(type)
        elsif type.is_a?(SymbolValue)
          SymbolValuePresenter.new(type)
        elsif type.is_a?(OptionArray)
          OptionArrayPresenter.new(type)
        elsif type.is_a?(OptionObject)
          OptionObjectPresenter.new(type)
        else
          raise NotImplementedError
        end
      end
    end
  end
end
