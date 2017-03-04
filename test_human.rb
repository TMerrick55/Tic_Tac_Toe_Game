require 'minitest/autorun'
require_relative 'human.rb'

class TestPlayer < Minitest::Test

	def test_get_player_move
		player = Human.new('X')
		assert_equal(0, player.get_move('placeholder'))
	end

	# def test_get_player_move_2
	# 	player = Human.new('O')
	# 	assert_equal(4, player.get_move('placeholder'))
	# end

	# def test_get_player_move_3
	# 	player = Human.new('X')
	# 	assert_equal(2, player.get_move('placeholder'))
	# end

	def test_get_player_move_4
		player = Human.new('O')
		assert_equal(6, player.get_move('placeholder'))
	end
end