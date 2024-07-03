class Component
  def temperatura_corporal
    raise NotImplementedError
  end
end

class Persona < Component
  def temperatura_corporal
    37
  end
end

class Decorator < Component
  attr_accessor :component

  def initialize(component)
    @component = component
  end

  def temperatura_corporal
    @component.temperatura_corporal
  end
end

class Sueter < Decorator
  def temperatura_corporal
    @component.temperatura_corporal + 2
  end
end

class Parca < Decorator
  def temperatura_corporal
    @component.temperatura_corporal + 5
  end
end

def client_code(component)
  puts "La temperatura corporal es #{component.temperatura_corporal}"
end

persona = Persona.new
puts 'Cliente: Tengo una persona'
client_code(persona)
puts "\n\n"

sueter = Sueter.new(persona)
puts 'Cliente: Tengo una persona con sueter'
client_code(sueter)
puts "\n\n"

parca = Parca.new(persona)
puts 'Cliente: Tengo una persona con parca'
client_code(parca)
puts "\n\n"

sueter_y_parca = Parca.new(Sueter.new(persona))
puts 'Cliente: Tengo una persona con sueter y parca'
client_code(sueter_y_parca)
puts "\n\n"

dos_sueters_y_parca = Parca.new(Sueter.new(Sueter.new(persona)))
puts 'Cliente: Tengo una persona con dos sueters y parca'
client_code(dos_sueters_y_parca)
puts "\n\n"
