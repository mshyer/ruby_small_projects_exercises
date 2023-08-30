require 'minitest/autorun'

class Tester < Minitest::Test
  def test_nil
    value = true
    assert_nil(value)
  end
end