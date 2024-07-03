class Subject

  def attach(observer)
    raise NotImplementedError
  end

  def detach(observer)
    raise NotImplementedError
  end

  def notify
    raise NotImplementedError
  end

end

class WineStock < Subject

  attr_accessor :bottles, :last, :critic_stock

  def initialize(bottles)
    @bottles = bottles
    @last = 0
    @critic_stock = 10
    @observers = []
    add_observer
  end

  def attach
    @observers << observer
  end

  def detach
    @observers.delete(observer)
  end

  def notify
    @observers.each { |observer| observer.update(self) }
  end

  def order(number_of_bottles)
    @last = number_of_bottles
    @bottles -= number_of_bottles
    notify
  end

  def add_observer
    @observers << OrderPlacer.new
    @observers << InventoryChecker.new
  end

end

class Observer

  def update(subject)
    raise NotImplementedError
  end

end

class InventoryChecker < Observer

  def update(subject)
    return unless subject.bottles < subject.critic_stock
    puts "debe contactarse con el proveedor de vinos y poner una nueva orden"
  end
end

class OrderPlacer < Observer

  def update(subject)
    puts "se coloco una orden de #{subject.last} botellas (quedan #{subject.bottles} botellas en la cava)"
  end
end

  def client_code(subject)

    subject.order(50)
    subject.order(49)
    subject.order(1)

  end

  wine_stock = WineStock.new(100)
  client_code(wine_stock)
