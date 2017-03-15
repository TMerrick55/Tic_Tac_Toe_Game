require 'minitest/autorun'
require_relative 'board.rb'

class Test_Tic_Tac_Toe < Minitest::Test
	
	def test_new_board
		board = Board.new
		assert_equal(Array.new(9, ''), board.ttt_board)
	end

	def test_update_first_position
		board = Board.new
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_first_position_X_and_second_O
		board = Board.new
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O',  '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_partial_board_at_last_position
		board = Board.new
		board.ttt_board = ['X', 'O',  '', 'O', '', '', '', '', '']
		board.update_position(8, 'X')
		assert_equal(['X', 'O',  '', 'O', '', '', '', '', 'X'], board.ttt_board)
	end

	def test_check_if_position_is_available
		board = Board.new
		board.ttt_board = ['X', 'O',  '', 'O', '', '', '', '', '']
		assert_equal(true, board.valid_position?(5))
		assert_equal(false, board.valid_position?(0))					
		assert_equal(false, board.valid_position?(15))
		assert_equal(true, board.valid_position?(7))
	end

	def test_for_full_board_false
		board = Board.new
		board.ttt_board = ['X', 'O',  'X', 'O', 'O', 'X', 'O', 'X', '']
		assert_equal(false, board.full_board?(board))
	end

	def test_for_full_board_true
		board = Board.new
		board.ttt_board = ['X', 'O',  'X', 'O', 'O', 'X', 'O', 'X', 'O']
		assert_equal(true, board.full_board?(board))
	end

	def test_valid_input
		board = Board.new
		assert_equal(false, board.valid_input?('m'))
		assert_equal(true, board.valid_input?('x'))
		assert_equal(true, board.valid_input?('O'))
		assert_equal(false, board.valid_input?(''))
		assert_equal(false, board.valid_input?('@'))
		assert_equal(true, board.valid_input?('X'))
		assert_equal(true, board.valid_input?('o'))
	end

	def test_for_win_at_positions_0_1_2_with_X
		board = Board.new
		marker = 'X'
		board.ttt_board =  ['X', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'O']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_positions_6_7_8_with_O
		board = Board.new
		marker = 'O'
		board.ttt_board = ['X', 'O', 'X', 'O', 'X', 'x', 'O', 'O', 'O']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_positions_0_4_8_with_X
		board = Board.new
		marker = 'X'
		board.ttt_board = ['X', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'X']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_positions_2_4_6_with_O
		board = Board.new
		marker = 'O'
		board.ttt_board = ['X', 'X', 'O', 'O', 'O', 'X', 'O', 'X', 'X']
		assert_equal(true, board.winner?(marker))
	end

	def test_winner_with_empties
		board = Board.new
		marker = 'X'
		board.ttt_board = ['X', 'X', 'O', 'X', 'O', '', 'X', 'O', '']
		assert_equal(true, board.winner?(marker))
	end

	def test_no_winner_with_empties
		board = Board.new
		marker = 'X'
		board.ttt_board = ['O', '', 'X', 'X', '', 'O', 'O', '', '']
		assert_equal(false, board.winner?(marker))
	end

	def test_full_board_with_winner
		board = Board.new
		marker = 'O'
		board.ttt_board = ['X', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'O']
		assert_equal(true, board.winner?(marker))
	end
end