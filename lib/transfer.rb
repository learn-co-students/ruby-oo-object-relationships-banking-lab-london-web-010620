class Transfer
  # your code here

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction 
  
    if @sender.balance < @amount || valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @sender.balance > @amount && status == "pending"
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
    end
    
  end

  def reverse_transfer

    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(@amount * -1)
      @status = "reversed"
    end
    
  end

end
