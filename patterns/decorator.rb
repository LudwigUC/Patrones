# The base Component interface defines operations that can be altered
# by decorators.
class Component

  def operation
    raise NotImplementedError
  end
end

# Concrete Components provide default implementations of the operations.
# There might be several variations of these classes.
class ConcreteComponent < Component
  def operation
    "ConcreteComponent"
  end
end

# The base Decorator class follows the same interface as the other components.
# The primery purpose of this class is to define the wrapping interface for all
# concrete decorators. The default implementation of the wrapping code might
# include a field for storing a wrapped component and the means to initialize it.

class Decorator < Component
  attr_accessor :component

  def initialize(component)
    @component = component
  end

  # The Decorator delegates all work to the wrapped component.
  def operation
    @component.operation
  end
end

# Concrete Decorators call the wrapped object and alter its result in some way.
class ConcreteDecoratorA < Decorator
  def operation
    # Call the wrapped object and add some functionality.
    "ConcreteDecoratorA(#{@component.operation})"
  end
end

class ConcreteDecoratorB < Decorator
  def operation
    # Call the wrapped object and add some functionality.
    "ConcreteDecoratorB(#{@component.operation})"
  end
end

def client_code(component)
  # ...
  puts "RESULT: #{component.operation}"
  # ...
end

simple = ConcreteComponent.new
puts 'Client: I\'ve got a simple component:'
client_code(simple)
puts "\n\n"

decorator1 = ConcreteDecoratorA.new(simple)
decorator2 = ConcreteDecoratorB.new(decorator1)
puts 'Client: Now I\'ve got a decorated component:'
client_code(decorator2)
