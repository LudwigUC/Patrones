class Builder

  def produce_part_a
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def produce_part_b
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def produce_part_c
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteBuilder1 < Builder

  def initialize
    reset
  end

  def reset
    @product = Product1.new
  end

  def product
    product = @product
    reset
    product
  end

  def produce_part_a
    @product.add('PartA1')
  end

  def produce_part_b
    @product.add('PartB1')
  end

  def produce_part_c
    @product.add('PartC1')
  end
end

class Product1
  def initialize
    @parts = []
  end

  def add(part)
    @parts << part
  end

  def list_parts
    puts "Product parts: #{@parts.join(', ')}"
  end
end

class Director

  attr_accessor :builder

  def initialize
    @builder = nil
  end

  def builder=(builder)
    @builder = builder
  end

  def build_minimal_viable_product
    @builder.produce_part_a
  end

  def build_full_featured_product
    @builder.produce_part_a
    @builder.produce_part_b
    @builder.produce_part_c
  end
end

director = Director.new
builder = ConcreteBuilder1.new
director.builder = builder

puts "Standart basic product:"
director.build_minimal_viable_product
builder.product.list_parts

puts "\n\n"

puts "Standart full featured product:"
director.build_full_featured_product
builder.product.list_parts

puts "\n\n"

puts "Custom product: "
builder.produce_part_a
builder.produce_part_b
builder.product.list_parts
