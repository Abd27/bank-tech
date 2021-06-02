# frozen_string_literal: true

require 'Bank'

describe Bank do
  it 'starts with a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '.deposit' do
    it 'adds to balance' do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end
  end
end
