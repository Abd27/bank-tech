# frozen_string_literal: true

class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(args)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = args[:credit]        
    @debit = args[:debit]          
    @balance = args[:balance]
  end
end
