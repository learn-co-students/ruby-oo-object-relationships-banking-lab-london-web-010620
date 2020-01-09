class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end 

  def valid?
    if @sender.valid? && @receiver.valid? 
      return true 
    end
  end 

  
  def execute_transaction
    #.pry
    if @status != "complete" && self.valid? && @sender.balance >= @amount # check valid, check status, check balance vs amount
      @sender.deposit(@amount *-1)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
    @receiver.deposit(@amount *-1)
    @sender.deposit(@amount)
    @status = "reversed"
    end
  end
  
  
  
  









end
