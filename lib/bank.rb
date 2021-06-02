# frozen_string_literal: true

class Bank
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
  end

  def withdrawl(amount)
    raise 'insufficient balance' if amount > @balance

    @balance -= amount
  end
end
