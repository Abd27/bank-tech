# frozen_string_literal: true

require 'Bank'

describe Bank do
  let(:transaction) { double('Transaction', date: Time.now.strftime('%d/%m/%Y'), credit: 100, debit: nil, balance: 100) }
  it { is_expected.to respond_to(:transactions) }

  it 'starts with a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '.deposit' do
    it 'adds to balance' do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end

    it 'creates a transaction' do
      allow(Transaction).to receive(:new).and_return(transaction)
      subject.deposit(100)
      expect(subject.transactions.first.balance).to eq(100)
    end
  end

  describe '.withdrawl' do
    before { subject.deposit(100) }

    it 'takes away from the balance' do
      expect { subject.withdrawl(50) }.to change { subject.balance }.by(-50)
    end

    it 'creates a transaction on withdrawl' do
      subject.withdrawl(50)
      expect(subject.transactions[1]).to be_instance_of(Transaction)
      expect(subject.transactions[1].balance).to eq(50)
    end

    it 'raise and error if the withdrawl amount is not available' do
      expect { subject.withdrawl(150) }.to raise_error('insufficient balance')
    end
  end
end
