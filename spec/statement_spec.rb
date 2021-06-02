# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:transaction1) { double('Transaction', date: Time.now.strftime('%d/%m/%Y'), credit: 100, debit: 0, balance: 100) }
  let(:transaction2) { double('Transaction', date: Time.now.strftime('%d/%m/%Y'), credit: 0, debit: 50, balance: 50) }
  let(:bank)         { double('Transaction', transactions: [transaction1, transaction2]) }
  let(:subject)      { described_class.new(bank.transactions) }
  it 'takes transactions upon initialize and saves in entries array' do
    
    expect(subject.entries).to include("02/06/2021 || 0.00 || 50.00 || 50.00")
  end

  describe '.display' do
    it 'prints the statment on screen' do
      example = "date || credit || debit || balance\n02/06/2021 || 0.00 || 50.00 || 50.00\n02/06/2021 || 100.00 || 0.00 || 100.00\n"
      expect{subject.display}.to output(example).to_stdout
    end
  end
end
