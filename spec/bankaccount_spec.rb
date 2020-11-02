require 'bankaccount'

describe BankAccount do

  it "creates a new account with a starting balance of 0" do
    expect(subject.balance).to eq 0
  end

  describe "#deposit" do
    it "allows the user to deposit money & updates balance" do
      savings = BankAccount.new
      expect(savings.deposit(100)).to eq 100
    end
  end

  describe "#withdraw" do
    it "allows the user to withdraw money & updates balance" do
      savings = BankAccount.new
      savings.deposit(100)
      expect(savings.withdraw(50)).to eq 50
    end

    it "returns an error if the user tries to withdraw more than they have in the account" do
      savings = BankAccount.new
      savings.deposit(100)
      expect{ savings.withdraw(150) }.to raise_error "Error! Balance £#{savings.balance}"
    end
  end
end
