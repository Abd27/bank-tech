# frozen_string_literal: true

require 'transaction'

describe Transaction do
  it 'creates a transaction for deposit and date' do
    subject = Transaction.new(deposit: 50, balance: 150)
    expect(subject.credit).to eq(50)
    expect(subject.date).to eq(Time.now.strftime('%d/%m/%Y'))
  end
end
