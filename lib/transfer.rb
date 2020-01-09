class Transfer
    attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? == true && @receiver.valid? == true
       true   
  end

  def execute_transaction
    if @sender.status == "closed" || @sender.balance < @amount
      # @sender.display_balance.scan(/\d+/)[0].to_i < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      return "Transaction was already executed"
    else
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
