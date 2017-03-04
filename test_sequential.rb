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

	def test_AI_picks_third_pos
		ai = Sequential.new('O')
		assert_equal(2, ai.get_move(['X', 'X', '', '', '', '', '', '', '']))
	end

	def test_AI_picks_fourth_pos
		ai = Sequential.new('O')
		assert_equal(3, ai.get_move(['X', 'X', 'X', '', '', '', '', '', '']))
	end

	def test_AI_picks_fifth_pos
		ai = Sequential.new('O')
		assert_equal(4, ai.get_move(['X', 'X', 'X', 'X', '', '', '', '', '']))
	end

	def test_AI_picks_sixth_pos
		ai = Sequential.new('O')
		assert_equal(5, ai.get_move(['X', 'X', 'X', 'X', 'X', '', '', '', '']))
	end
end