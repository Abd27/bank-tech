# frozen_string_literal: true

class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(args)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = args[:credit]        || 0
    @debit = args[:debit]          || 0
    @balance = args[:balance]
  end
end
