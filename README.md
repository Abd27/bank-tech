# bank-tech

## Intent
 Test Drive a simple program that records client's transactions and able to print a bank statment.

## User stories
> As a user
So i can have money in my account
I want to be able to make a deposit of certain amount.


> As a user
So i can use my money
I want to be able to make a withdrawal


> As a user
So i can know how about my transections
I want to be able to see the bank statements


### Gems
* simplecov
* rspec
* rubocop

### How to Run
* `bundle`
* `irb -r ./lib/bank.rb`

### A run down
```bash
3.0.1 :001 > bank = Bank.new
3.0.1 :002 > bank.deposit(100)
3.0.1 :003 > bank.withdrawl(50)

3.0.1 :004 > bank.print_statement
date || credit || debit || balance
02/06/2021 || 0.00 || 50.00 || 50.00
02/06/2021 || 100.00 || 0.00 || 100.00 

