require 'optionizer/rails/version'
require 'active_support'
require 'action_view'
require 'react-rails'
require 'browserify-rails'
require 'slim'

module Optionizer
  module Rails
    class Engine < ::Rails::Engine
      config.to_prepare do
        ::Rails.application.config.tap do |config|
          config.assets.precompile += %w[server_rendering.js]

          config.browserify_rails.commandline_options = '--transform -t babelify'
          config.browserify_rails.source_map_environments << 'development'
          config.browserify_rails.paths = [
            ->(p) { p.start_with?(Engine.root.join('node_modules').to_s) },
            ->(p) { p.start_with?(Engine.root.join('vendor/assets/javascripts/components').to_s) }
          ]
          config.browserify_rails.node_bin = Engine.root.join('node_modules', '.bin').to_s
        end
      end
    end

    class Error < StandardError; end

    # Factories
    autoload :OptionValueFactory,    'optionizer/rails/factories/option_value_factory'
    autoload :PresenterFactory,      'optionizer/rails/factories/presenter_factory'

    # Helpers
    autoload :OptionHelper,          'optionizer/rails/helpers/option_helper'

    # Managers
    autoload :OptionManager,         'optionizer/rails/managers/option_manager'

    # Models
    autoload :BaseModel,             'optionizer/rails/models/base_model'
    autoload :BooleanValue,          'optionizer/rails/models/boolean_value'
    autoload :NilValue,              'optionizer/rails/models/nil_value'
    autoload :NumericValue,          'optionizer/rails/models/numeric_value'
    autoload :OptionArray,           'optionizer/rails/models/option_array'
    autoload :OptionObject,          'optionizer/rails/models/option_object'
    autoload :OptionValue,           'optionizer/rails/models/option_value'
    autoload :StringValue,           'optionizer/rails/models/string_value'
    autoload :SymbolValue,           'optionizer/rails/models/symbol_value'

    # Presenters
    autoload :BasePresenter,         'optionizer/rails/presenters/base_presenter'
    autoload :BooleanValuePresenter, 'optionizer/rails/presenters/boolean_value_presenter'
    autoload :NilValuePresenter,     'optionizer/rails/presenters/nil_value_presenter'
    autoload :NumericValuePresenter, 'optionizer/rails/presenters/numeric_value_presenter'
    autoload :OptionArrayPresenter,  'optionizer/rails/presenters/option_array_presenter'
    autoload :OptionObjectPresenter, 'optionizer/rails/presenters/option_object_presenter'
    autoload :StringValuePresenter,  'optionizer/rails/presenters/string_value_presenter'
    autoload :SymbolValuePresenter,  'optionizer/rails/presenters/symbol_value_presenter'
    autoload :OptionValuePresenter,  'optionizer/rails/presenters/option_value_presenter'

    # Shared
    autoload :Shared,                'optionizer/rails/shared/shared'

    # Interfaces
    autoload :PresentersInterface,   'optionizer/rails/interfaces/presenters_interface'

    # Parser
    autoload :OptionParser,          'optionizer/rails/option_parser'

    ActionView::Base.include(OptionHelper)
    ActionController::Base.send(:prepend_view_path, "#{File.expand_path('../..', __FILE__)}/optionizer/rails/views")
  end
end
