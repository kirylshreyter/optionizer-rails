module Optionizer
  module Rails
    class BasePresenter
      include Shared::ElementWrappers

      def initialize(object)
        @object = object
      end

      def display
        raise NotImplementedError
      end

      def method_missing(method, *args, &block)
        return super unless @object.respond_to?(method)

        @object.public_send(method, *args, &block)
      end

      def respond_to_missing?(method, *args)
        @object.respond_to?(method) || super
      end
    end
  end
end
