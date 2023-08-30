require 'minitest/autorun'

class Tester < Minitest::Test
  def test_element_of_list
    list = []
    refute_includes(list, 'xyz')
  end
end