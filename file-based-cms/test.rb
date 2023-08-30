require 'minitest/autorun'
require_relative 'cms'
# require 'minitest-reporters'

class MyFirstTest < Minitest::Test
	def setup
		@var = "cool"
	end
	def test_first_test
		assert true
	end
	def test_root_string
		root = ROOT
		assert_instance_of(String, ROOT)
	end
	def teardown
	end
end