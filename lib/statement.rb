# frozen_string_literal: true

class Statement
  attr_reader :entries

  def initialize(transactions)
    @entries = []
    update_entries(transactions)
  end

  def display
    puts header
    entries.each do |entry|
      puts entry
    end
  end

  private

  def update_entries(transactions)
    transactions.reverse.each do |transaction|
      entry = "#{transaction.date} || #{'%.2f' % transaction.credit} || #{'%.2f' % transaction.debit} || #{'%.2f' % transaction.balance}"
      @entries << entry
    end
  end

  def header
    'date || credit || debit || balance'
  end
end
