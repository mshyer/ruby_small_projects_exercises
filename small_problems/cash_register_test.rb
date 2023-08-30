require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'
require 'minitest/reporters'
#require 'stringio'

Minitest::Reporters.use!

class CashRegisterTest < Minitest::Test
  attr_accessor :register, :transaction
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(50)
    @transaction.amount_paid = 50
  end

  def test_accept_money
    amount = register.total_money
    register.accept_money(transaction)
    assert_equal(register.total_money, (amount + 50))
  end

  def test_change
    new_transaction = Transaction.new(100)
    new_transaction.amount_paid = 175
    assert_equal(register.change(new_transaction), 75)
  end

  def test_give_receipt
    assert_output(stdout = "You've paid $#{transaction.amount_paid}.\n") do
      register.give_receipt(transaction)
    end
  end

  def test_prompt_for_payment
    new_transaction = Transaction.new(100)
    mock_input = StringIO.new("100\n")
    mock_output = StringIO.new
    new_transaction.prompt_for_payment(input: mock_input, output: mock_output)
    assert_equal(new_transaction.amount_paid, 100)
  end

end