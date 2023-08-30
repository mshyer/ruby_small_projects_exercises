require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Tester < Minitest::Test
  def setup
    @value = 1
  end

  def test_odd
    assert_equal(@value.odd?, true)
    # assert @value.odd?, "hahahaha"
    # assert @value.even?, "hahahaha"
  end
end