class BankAccount
  attr_accessor :balance

  def initialize(account_owner)
    @owner = account_owner
    @balance = 0
  end

  # def balance
  #   @balance
  # end

  # def balance=(balance)
  #   @balance = balance
  # end
end

bank = BankAccount.new("Marcin")
bank.balance = 10
puts bank.balance
