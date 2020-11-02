require 'bankaccount'

describe BankAccount do

  it "creates a new account with a starting balance of 0" do
    expect(subject.balance).to eq 0
  end


end
