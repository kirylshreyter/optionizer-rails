class Optionizer::Parser
  attr_accessor :result

  def initialize(factory, base_object_name)
    @base_object_name = base_object_name
    @factory = factory
    @result = []
  end

  def parse(input = {}, result = @result, object = @base_object_name)
    input.each_pair do |object_name, value|
      result << Optionizer::Option.new.tap { |option| option.value = build_option(value, object, object_name) }
    end
    result
  end

  private

  def build_option(value, object, object_name = nil)
    object_chain = [object].compact
    if value.is_a?(Hash)
      HashObject.new(parse(value, [], object_chain + ["[#{object_name}]"])).tap do |option|
        option.label = object_name
      end
    elsif value.is_a?(Array)
      from_array(value, object_chain + ["[#{object_name}]"])
    else
      fetch_option(value, object_chain + ["[#{object_name}]"])
    end
  end

  def from_array(array, object_chain)
    options_array = [].tap do |result|
      array.each do |item|
        result << build_option(item, object_chain)
      end
    end
    ArrayOption.new(options_array).tap do |option|
      option.label = object_chain.last.delete('[]')
    end
  end

  def fetch_option(value, object_chain)
    @factory.get_option(value).tap { |option| option.add_object_to_chain(object_chain) }
  end
end
