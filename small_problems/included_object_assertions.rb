require 'minitest/autorun'

class Tester < Minitest::Test
  def test_included_object
    list = [1]
    value = 1
    assert_includes(list, value)
  end
end