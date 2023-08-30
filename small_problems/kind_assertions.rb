require 'minitest/autorun'

class Tester < Minitest::Test
  def test_kind
    value = 3
    assert_kind_of(Numeric, value)
  end
end