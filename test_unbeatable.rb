require 'minitest/autorun'
require_relative 'unbeatable.rb'

class TestUnbeatable < Minitest::Test

	# def test_new_player_X
	# 	player = Unbeatable.new('X')
	# 	assert_equal('X', player.marker)
	# end

	# def test_win_at_2nd_pos_with_X
	# 	player = Unbeatable.new('X')
	# 	ttt_board = ['X', 'X', '', '', '', '', '', '', '']
	# 	assert_equal(2, player.get_move(ttt_board))
	# end

	def test_win_at_last_position_with_X
		player = Unbeatable.new('X')
		ttt_board = ['', '', '', '', '', '', '', 'X', 'X']
		assert_equal(8, player.get_move(ttt_board))
	end

	def test_win_at_4
		player = Unbeatable.new('X')
		ttt_board = ['X', '', '', '', '', '', '', '', 'X']
		assert_equal(4, player.get_move(ttt_board))
	end

	# def test_no_win
	# 	player = Unbeatable.new('X')
	# 	ttt_board = ['X', '', '', '', '', '', '', '', '']
	# 	assert_equal(1, player.get_move(ttt_board))
	# end

	def test_win_at_5
		player = Unbeatable.new('O')
		ttt_board = ['', '', 'O', '', '', '', '', '', 'O']
		assert_equal(5, player.get_move(ttt_board))
	end

	# def test_block_1
	# 	player = Unbeatable.new('X')
	# 	ttt_board = ['O', 'O', '', '', '', '', '', '', '']
	# 	assert_equal(2, player.get_move(ttt_board))
	# end

	# def test_block_2
	# 	player = Unbeatable.new('X')
	# 	ttt_board = ['O', '', '', '', 'O', '', '', 'X', '']
	# 	assert_equal(8, player.get_move(ttt_board))
	# end

	def test_fork_1

	end

	def test_block_fork

	end
end