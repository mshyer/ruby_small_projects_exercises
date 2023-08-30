require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
  def test_wheels2
    skip("I WONT GET FOOLED AGAIN!!")
    car = Car.new
    car2 = Car.new
    assert_equal(3, car.wheels)
  end
  def test_wheels3
    car = Car.new
    assert_equal(3, car.wheels)
  end
end