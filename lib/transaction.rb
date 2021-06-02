# frozen_string_literal: true

class Transaction
  attr_reader :date, :credit

  def initialize(args)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = args[:deposit] || ''
  end
end
