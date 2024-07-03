# The Abstrac Class defines a template method that contains a skeleton of some
# algorithm composed of calls, usually to abstract primitive operations.

# Concrete subclasses shoul implement these operations, but the template
# method itself intact

class AbstractClass

  def template_method
    base_operation1
    required_operation1
    base_operation2
    hook1
    required_operation2
    base_operation3
    hook2
  end

  # These operations already have implementations

  def base_operation1
    puts "AbstractClass says: I am doing the bulk of the work"
  end

  def base_operation2
    puts "AbstractClass says: ButI let subclasses override some operations"
  end

  def base_operation3
    puts "AbstractClass says: But I am doing the bulk of the work anyways"
  end

  def required_operation1
    raise NotImplementedError
  end

  def required_operation2
    raise NotImplementedError
  end

  # These are "hooks". Subclasses may override them, but it's not mandatory
  def hook1; end

  def hook2; end
end

# Concrete classes have to implement all abstract operations of the base class.
# They can also override some operations with a default implementation

class ConcreteClass1 < AbstractClass

  def required_operation1
    puts "ConcreteClass1 says: Implemented Operation1"
  end

  def required_operation2
    puts "ConcreteClass1 says: Implemented Operation2"
  end
end

class ConcreteClass2 < AbstractClass

  def required_operation1
    puts "ConcreteClass2 says: Implemented Operation1"
  end

  def required_operation2
    puts "ConcreteClass2 says: Implemented Operation2"
  end

  def hook1
    puts "ConcreteClass2 says: Overridden Hook1"
  end
end

# The client code calls the template method to execute the algorithm. Client
# code does not have to know the concrete class of an object it works with, as
# long as it works with objects through the interface of their base class

def client_code(abstract_class)

  abstract_class.template_method

end

puts "Same client code can work with different subclasses"
client_code(ConcreteClass1.new)
puts "\n"

puts "Same client code can work with different subclasses"
client_code(ConcreteClass2.new)
