require 'minitest/autorun'

class Tester < Minitest::Test
  def test_raises_exception
    assert_raises StandardError do 
      employee.hire
    end
  end
end