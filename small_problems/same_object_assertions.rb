require 'minitest/autorun'

class Tester < Minitest::Test
  def test_same_object
    list = [1,2,3]
    process = list.each {|item| "sdasf"}
    assert_same(list, process)
  end
end