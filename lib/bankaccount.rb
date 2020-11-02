class BankAccount

attr_reader :balance

  def initialize(balance=0)
    @balance = balance
  end

  def deposit(amount)
    total(amount)
  end

  def withdraw(amount)
    fail "Error! Balance £#{@balance}" if amount > @balance
    total(-amount)
  end

private
  def total(amount)
    @balance += amount
  end

end
