class Contact

  def receiveMessage(msg)
    puts "you receive this message: #{msg}"
  end
end

class Subject

  def sendMessage
    NotImplementedError
  end
end

class MessageSender < Subject

  def initialize(cnt)
    @contact = cnt

  end

  def sendMessage(msg)
    @contact.receiveMessage(msg)

  end

end

class Proxy < MessageSender

  def initialize(real_MessageSender)
    @real_MessageSender = real_MessageSender
  end

  def sendMessage(msg)
    adapter = Adapter.new(msg)
    msg =  adapter.request
    return unless check_access

    if msg.include?("Trump")
      puts "Potencial Capitalista"
    end
    @real_MessageSender.sendMessage(msg)
  end

  def check_access
    puts "Proxy: Checking access prior to firing a real request"
    true
  end
end

class Target
  def request
    "Set default interface to adapt"
  end
end

class Adapter < Target

  def initialize(adaptee)
    @adaptee = adaptee
  end

  def request
    if @adaptee == "F"
      @adaptee = "@#@$"
    end
    return @adaptee
  end
end

secretContact = Contact.new

puts "Executing with a real Contact"
sender = MessageSender.new(secretContact)
sender.sendMessage('saludos desde marte')
puts "\n"

puts "Executing with a Proxy"
proxy = Proxy.new(sender)
proxy.sendMessage('saludos desde marte. atte Trump')
proxy.sendMessage('F')
puts "\n"
