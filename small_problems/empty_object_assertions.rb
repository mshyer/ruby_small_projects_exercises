require 'minitest/autorun'

class Tester < Minitest::Test
  def test_empty
    list = []
    assert_empty(list)
  end
end