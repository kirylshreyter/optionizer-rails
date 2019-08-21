require 'action_view'

module Optionizer
  module Rails
    module Shared
      module ElementWrappers
        include ActionView::Context
        include ActionView::Helpers::FormTagHelper

        def root_div(root)
          content_tag(:div, name: root, class: 'root border border-primary rounded', id: 'root') { yield }
        end

        def object_div
          content_tag(:div, name: :object, class: 'object', id: 'object') { yield }
        end

        def array_div
          content_tag(:div, name: :array, class: 'array', id: 'array') { yield }
        end

        def option_div(name)
          content_tag(:div, name: name, class: 'option', id: 'option') { yield }
        end

        def label_div(name)
          content_tag(:button, class: 'option-label btn btn-secondary btn-sm', id: 'option-label') { name.to_s }
        end

        def change_button(name)
          content_tag(:button, class: 'option-change btn btn-info btn-sm') { name.to_s }
        end

        def input_div(name, value)
          content_tag(:input,
                      name: name,
                      class: 'option-input form-control',
                      id: 'option-input',
                      value: value,
                      _type: value.class) { yield if block_given? }
        end

        def hidden_input_div(name, value)
          content_tag(:input,
                      type: :hidden,
                      name: name,
                      class: 'hidden',
                      id: 'option-input',
                      value: value,
                      _type: value.class) { yield if block_given? }
        end

        def group_div(label, input)
          content_tag(:div, class: 'form-group border border-success rounded option-input-group') do
            concat(label)
            concat(delete_button)
            concat(input)
          end
        end

        def delete_button
          content_tag(:button, :X, type: :button, class: 'option-delete btn btn-danger btn-sm')
        end
      end
    end
  end
end
