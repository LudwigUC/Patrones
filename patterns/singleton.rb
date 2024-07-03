# class Singleton
#   @instance = new

#   private_class_method :new

#   def self.instance
#     @instance
#   end


#   def some_business_logic
#     # ...
#   end
# end

# s1 = Singleton.instance
# s2 = Singleton.instance

# if s1.equal?(s2)
#   print 'Singleton works, both variables contain the same instance.'
# else
#   print 'Singleton failed, variables contain different instances.'
# end


# ----------------- THREAD-SAFE SINGLETON -----------------

class Singleton
  attr_reader :value

  @instance_mutex = Mutex.new
  private_class_method :new

  def initialize(value)
    @value = value
  end

  def self.instance(value)
    return @instance if @instance

    @instance_mutex.synchronize do
      @instance ||= new(value)
    end

    @instance
  end

  def some_business_logic
    # ...
  end
end

def test_singleton(value)
  singleton = Singleton.instance(value)
  print singleton.value
end

process1 = Thread.new { test_singleton('FOO')}
process2 = Thread.new { test_singleton('BAR')}
process1.join
process2.join
