yellow = SimpleNode.new(1,1,0)
gray = SimpleNode.new(1,1,0)
purple = SimpleNode.new(1,1,1)
blue = SimpleNode.new(1,1,1)
composed = ComplexNode.new(2,2,[yellow,gray,purple,blue])
green = SimpleNode.new(2,2,1)
orange = SimpleNode.new(2,2,1)
red = SimpleNode. new(2,2,0)
main = ComplexNode.new(4,4, [green,composed,orange,red])
# operation contains
puts '=contains='
puts yellow.contains(1) # imprime false
puts gray.contains(1) # imprime false
puts purple.contains(1) # imprime verdad
puts blue.contains(1) # imprime verdad
puts composed.contains(1) # imprime verdad
puts green.contains(1) # imprime verdad
puts orange.contains(1) # imprime verdad
puts red.contains(1) # imprime false
puts main.contains(1) # imprime verdad
# operation count
puts '=count='
puts yellow.count(1) # imprime 0
puts gray.count(1) # imprime 0
puts purple.count(1) # imprime 1
puts blue.count(1) # imprime 1
puts composed.count(1) # imprime 2
puts green.count(1) # imprime 4
puts orange.count(1) # imprime 4
puts red.count(1) # imprime 0
puts main.count(1) # imprime 10
