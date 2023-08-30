require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Tester < Minitest::Test
  def setup
    @value = 'XYZ'
  end

  def test_odd
    assert_equal(@value.downcase, 'xyz')
  end
end