# frozen_string_literal: true

require 'Bank'

describe Bank do
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
      subject.deposit(100)
      # i have a question for reviewr, if i know transaction instance is working as intended
      # indpedently then assuming it will work as long as it is an instance of transaction should suffice.
      # is my logic correct on this?
      expect(subject.transactions.first).to be_instance_of(Transaction)
      # following was my other way of testing but it seems like we are testing it twice as we have tested exact same thing in transaction.
      expect(subject.transactions.first.balance).to eq(100)
    end
  end

  describe '.withdrawl' do
    it 'takes away from the balance' do
      subject.deposit(100)
      expect { subject.withdrawl(50) }.to change { subject.balance }.by(-50)
    end

    it 'raise and error if the withdrawl amount is not available' do
      expect { subject.withdrawl(50) }.to raise_error('insufficient balance')
    end
  end
end
