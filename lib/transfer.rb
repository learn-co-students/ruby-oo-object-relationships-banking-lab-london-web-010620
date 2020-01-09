require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end
  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      false
    end
  end

  def execute_transaction
    if sender.balance < amount || valid? == false 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    elsif sender.balance >= amount && status =='pending'
      @sender.deposit( amount * -1 ) 
      @receiver.deposit( amount )
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end

end
