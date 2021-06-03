# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:transaction1) { double('Transaction', date: Time.now.strftime('%d/%m/%Y'), credit: 100, debit: nil, balance: 100) }
  let(:transaction2) { double('Transaction', date: Time.now.strftime('%d/%m/%Y'), credit: nil, debit: 50, balance: 50) }
  let(:bank)         { double('Transaction', transactions: [transaction1, transaction2]) }
  let(:subject)      { described_class.new(bank.transactions) }
  it 'takes transactions upon initialize and saves in entries array' do
    expect(subject.entries).to include("#{Time.now.strftime('%d/%m/%Y')} ||  || 50.00 || 50.00")
  end

  describe '.display' do
    it 'prints the statment on screen' do
      example = "date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%Y')} ||  || 50.00 || 50.00\n#{Time.now.strftime('%d/%m/%Y')} || 100.00 ||  || 100.00\n"
      expect { subject.display }.to output(example).to_stdout
    end
  end
end
