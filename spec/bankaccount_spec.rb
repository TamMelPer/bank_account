require 'bankaccount'

describe BankAccount do

  describe "#balance" do
    it "shows the user their balance" do
      expect(subject.balance).to eq 0
    end
  end

end
