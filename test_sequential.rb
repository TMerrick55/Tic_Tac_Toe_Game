require 'minitest/autorun'
require_relative 'sequential.rb'

class Test_Sequential_AI < Minitest::Test

	def test_AI_picks_first_pos
		ai = Sequential.new('O')
		assert_equal(0, ai.get_move(['', '', '', '', '', '', '', '', '']))
	end

	def test_AI_picks_second_pos
		ai = Sequential.new('O')
		assert_equal(1, ai.get_move(['X', '', '', '', '', '', '', '', '']))
	end
end