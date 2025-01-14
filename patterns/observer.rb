# The subject interface declares a set of methods for managing subscribers

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

# The Subject owns some important state and notifies observers when
# the state changes

class ConcreteSubject < Subject

  attr_accessor :state

  def initialize
    @observers = []
  end

  def attach(observer)
    puts "Subject: Attached an observer -> #{observer}"
    @observers << observer
  end

  def detach(observer)
    puts "Subject: Detached an observer -> #{observer}"
    @observers.delete(observer)
  end

  def notify
    puts 'Subject: Notifying observers...'
    @observers.each { |observer| observer.update(self) }
  end

  # Usually, the subcription logic is only a fraction of what a Subject can
  # really do. Subjects commonly hold some important business logic, that
  # triggers a notification method whenever something important is about
  # to happen (or after it).

  def some_business_logic
    puts "\nSubject: I'm doing something important"
    @state = rand(0..10)

    puts "Subject: My state has just changed to: #{@state}"
    notify
  end
end

  # The Observer interface declares the update method, used by subjects.
  class Observer
    # Receive update from subject.
    def update(_subject)
      raise NotImplementedError
    end
  end

  # Concrete Observers react to the updates issued by the Subject they had been
  # attached to.

  class ConcreteObserverA < Observer

    def update(subject)
      puts "ConcreteObserverA: Reacted to the event"
    end
  end

  class ConcreteObserverB < Observer

    def update(subject)
      return unless subject.state.zero? || subject.state >= 2

      puts 'ConcreteObserverB: Reacted to the event'
    end
  end

  # The client code.

  subject = ConcreteSubject.new

  observer_a = ConcreteObserverA.new
  subject.attach(observer_a)

  observer_b = ConcreteObserverB.new
  subject.attach(observer_b)

  subject.some_business_logic
  subject.some_business_logic

  subject.detach(observer_a)

  subject.some_business_logic
