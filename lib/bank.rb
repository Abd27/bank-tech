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
    create_transaction(credit: amount, balance: @balance)
  end

  def withdrawl(amount)
    raise 'insufficient balance' if amount > @balance

    @balance -= amount
    create_transaction(debit: amount, balance: @balance)
  end

  private

  def create_transaction(args)
    @transactions << Transaction.new(args)
  end
end
