class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount, :last_transfer
  
  
  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false 
  end
  
  def execute_transaction
    if !(self.valid? && @sender.balance >= @amount)
      "Transaction rejected. Please check your account balance."
    else self.valid? && @sender.balance >= @amount
      @receiver.deposit(amount)
    end
    @status = "completed"
    @last_transfer = @receiver.deposit(amount)
  end
      
      
  
  
  
end
