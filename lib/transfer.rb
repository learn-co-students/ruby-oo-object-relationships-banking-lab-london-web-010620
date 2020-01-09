class Transfer
    #one instance of the class can transfer money to another 
    #through a `Transfer` class.
    #The `Transfer` class acts as a space for a transaction 
    #between two instances of the bank account class.
    #the bank needs to run checks first on each account
    #Transfer will run the checks and reject if invalid or 
    #sender doesn't have money --> check status is "open"
    #Transfers start out as pending
    attr_reader :sender, :receiver, :amount
    attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
      @sender.valid? == true && @receiver.valid? == true
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


