class PaymentProcessor

  def initialize(user, amount, payment_strategy)
    @user = user
    @amount = amount
    @payment_strategy = payment_strategy
  end

  def process_payment
    @payment_strategy.process_payment(@amount)
  end
end

class Payment
  def process_payment(amount)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class CreditCard < Payment
  def process_payment(amount)
    puts "Payment processed with credit card payment for amount: $#{amount}"
  end
end

class Paypal < Payment
  def process_payment(amount)
    puts "Payment processed with PayPal payment for amount: $#{amount}"
  end
end

class Bitcoin < Payment
  def process_payment(amount)
    puts "Payment processed with Bitcoin payment for amount: $#{amount}"
  end
end

# ---------------- EXECUTION ----------------

user = 'John Doe'
amount = 100

credit_card = PaymentProcessor.new(user, amount, CreditCard.new)
credit_card.process_payment

paypal = PaymentProcessor.new(user, amount, Paypal.new)
paypal.process_payment
