# frozen_string_literal: true
require_relative 'transaction'

class Bank
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount

    transaction = Transaction.new(credit: amount, balance: @balance)
    @transactions << transaction
  end

  def withdrawl(amount)
    raise 'insufficient balance' if amount > @balance

    @balance -= amount
  end

end
