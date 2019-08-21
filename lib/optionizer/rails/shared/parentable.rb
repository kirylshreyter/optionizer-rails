module Optionizer
  module Rails
    module Shared
      module Parentable
        attr_accessor :parent, :level

        def parents(parents = [])
          return parents if parent.blank?

          parents << parent
          parents(parents) if parent.parent.present?
          parents
        end
      end
    end
  end
end
