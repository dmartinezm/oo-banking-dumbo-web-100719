class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  @all = []

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    
    if valid? && sender.balance > amount && self.status == "pending"
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
    elsif valid? == false || sender.balance < amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && sender.balance > amount && self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
  else
    "Transaction rejected. Please check your account balance."
  end
  end

  def self.all
    @@all
  end
end
