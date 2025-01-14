# The Target defines the domain-specific interface used by te client code.
class Target

  def request
    "Target: The default target\'s behavior."
  end
end

# The Adaptee contains some useful behavior, but its interface is incompatible
class Adaptee

  def specific_request
    ".eetpadA eht fo roivaheb laicepS"
  end
end

# The Adapter makes the Adaptee's interface compatible with the Target's interface
class Adapter < Target
  def initialize(adaptee)
    @adaptee = adaptee
  end

  def request
    result = @adaptee.specific_request.reverse
    "Adapter: (TRANSLATED) #{result}"
  end
end

def client_code(target)
  print target.request
end

puts 'Client: I can work just fine with the Target objects:'
target = Target.new
client_code(target)
puts "\n\n"

adaptee = Adaptee.new
puts "client: The Adaptee class has a weird interface:"
puts "Adaptee: #{adaptee.specific_request}"
puts "\n"

puts "Client: But I can work with it via the Adapter:"
adapter = Adapter.new(adaptee)
client_code(adapter)
