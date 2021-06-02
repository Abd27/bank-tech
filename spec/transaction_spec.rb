# frozen_string_literal: true

require 'transaction'

describe Transaction do
  it 'creates a transaction for deposit and date' do
    subject = Transaction.new(credit: 50, balance: 150)
    expect(subject.credit).to eq(50)
    expect(subject.date).to eq(Time.now.strftime('%d/%m/%Y'))
  end

  it 'creats a transaction for withdrawl' do
    subject = Transaction.new(debit: 50, balance: 150)
    expect(subject.debit).to eq(50)
    expect(subject.balance).to eq(150)
  end 
end
