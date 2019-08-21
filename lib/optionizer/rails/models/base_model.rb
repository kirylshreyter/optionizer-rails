module Optionizer
  module Rails
    class BaseModel
      include Shared::Presentable
      include Shared::Parentable

      AVAILABLE_TYPES = %i[boolean nil numeric string symbol array object]
    end
  end
end

