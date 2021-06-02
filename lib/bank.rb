# frozen_string_literal: true

class Bank
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdrawl(amount)
    raise 'insufficient balance' if amount > @balance

    @balance -= amount
  end
end
