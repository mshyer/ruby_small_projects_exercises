require 'minitest/autorun'

class Tester < Minitest::Test
  def test_type
    value = Numeric
    assert_instance_of(Numeric, value)
  end
end