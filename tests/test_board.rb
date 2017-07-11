require 'minitest/autorun'
require_relative '../board.rb'

class Test_Tic_Tac_Toe_board_sizes < Minitest::Test
	
	def test_create_3_by_3_board
		board = Board.new(9, 3, 3)
		assert_equal(['', '', '', '', '', '','', '', ''], board.ttt_board)
	end

	def test_create_4_by_4_board
		board = Board.new(16, 4, 4)
		assert_equal(['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_create_5_by_5_board
		board = Board.new(25, 5, 5)
		assert_equal(['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_create_6_by_6_board
		board = Board.new(36, 6, 6)
		assert_equal(['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_create_7_by_7_board
		board = Board.new(49, 7, 7)
		assert_equal(['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_create_8_by_8_board
		board = Board.new(64, 8, 8)
		assert_equal(['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_create_9_by_9_board
		board = Board.new(81, 9, 9)
		assert_equal(['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_create_10_by_10_board
		board = Board.new(100, 10, 10)
		assert_equal(['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_create_11_by_11_board
		board = Board.new(121, 11, 11)
		assert_equal(['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_create_12_by_12_board
		board = Board.new(144, 12, 12)
		assert_equal(['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end
end

class Test_Tic_Tac_Toe_markers_3_by_3 < Minitest::Test

	def test_update_first_position_3_by_3
		board = Board.new(9, 3, 3)
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_first_position_X_and_second_O_3_by_3
		board = Board.new(9, 3, 3)
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_partial_board_at_last_position_3_by_3
		board = Board.new(9, 3, 3)
		board.ttt_board = ['X', 'O', '', 'O', '', '', '', '', '']
		board.update_position(8, 'X')
		assert_equal(['X', 'O', '', 'O', '', '', '', '', 'X'], board.ttt_board)
	end

	def test_check_if_position_is_available_3_by_3
		board = Board.new(9, 3, 3)
		board.ttt_board = ['X', 'O', '', 'O', '', '', '', '', '']
		assert_equal(true, board.valid_position?(5))
		assert_equal(false, board.valid_position?(0))					
		assert_equal(false, board.valid_position?(15))
		assert_equal(true, board.valid_position?(7))
	end

	def test_for_full_board_false_3_by_3
		board = Board.new(9, 3, 3)
		board.ttt_board = ['X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', '']
		assert_equal(false, board.full_board?(board))
	end

	def test_for_full_board_true_3_by_3
		board = Board.new(9, 3, 3)
		board.ttt_board = ['X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'O']
		assert_equal(true, board.full_board?(board))
	end

	def test_valid_input_3_by_3
		board = Board.new(9, 3, 3)
		assert_equal(false, board.valid_input?('m'))
		assert_equal(true, board.valid_input?('x'))
		assert_equal(true, board.valid_input?('O'))
		assert_equal(false, board.valid_input?(''))
		assert_equal(false, board.valid_input?('@'))
		assert_equal(true, board.valid_input?('X'))
		assert_equal(true, board.valid_input?('o'))
	end

	def test_for_win_at_positions_0_1_2_with_X_3_by_3
		board = Board.new(9, 3, 3)
		marker = 'X'
		board.ttt_board =  ['X', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'O']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_positions_6_7_8_with_O_3_by_3
		board = Board.new(9, 3, 3)
		marker = 'O'
		board.ttt_board = ['X', 'O', 'X', 'O', 'X', 'x', 'O', 'O', 'O']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_positions_0_4_8_with_X_3_by_3
		board = Board.new(9, 3, 3)
		marker = 'X'
		board.ttt_board = ['X', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'X']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_positions_2_4_6_with_O_3_by_3
		board = Board.new(9, 3, 3)
		marker = 'O'
		board.ttt_board = ['X', 'X', 'O', 'O', 'O', 'X', 'O', 'X', 'X']
		assert_equal(true, board.winner?(marker))
	end

	def test_winner_with_empties_3_by_3
		board = Board.new(9, 3, 3)
		marker = 'X'
		board.ttt_board = ['X', 'X', 'O', 'X', 'O', '', 'X', 'O', '']
		assert_equal(true, board.winner?(marker))
	end

	def test_no_winner_with_empties_3_by_3
		board = Board.new(9, 3, 3)
		marker = 'X'
		board.ttt_board = ['O', '', 'X', 'X', '', 'O', 'O', '', '']
		assert_equal(false, board.winner?(marker))
	end

	def test_full_board_with_winner_3_by_3
		board = Board.new(9, 3, 3)
		marker = 'O'
		board.ttt_board = ['X', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'O']
		assert_equal(true, board.winner?(marker))
	end
end

class Test_Tic_Tac_Toe_markers_4_by_4 < Minitest::Test

	def test_update_first_position_4_by_4
		board = Board.new(16, 4, 4)
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_first_position_X_and_second_O_4_by_4
		board = Board.new(16, 4, 4)
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_partial_board_at_last_position_4_by_4
		board = Board.new(16, 4, 4)
		board.ttt_board = ['X', 'O', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '']
		board.update_position(15, 'X')
		assert_equal(['X', 'O', '', '', 'O', '', '', '', '', '', '', '', '', '', '', 'X'], board.ttt_board)
	end

	def test_check_if_position_is_available_4_by_4
		board = Board.new(16, 4, 4)
		board.ttt_board = ['X', 'O', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '']
		assert_equal(true, board.valid_position?(5))
		assert_equal(false, board.valid_position?(0))					
		assert_equal(true, board.valid_position?(15))
		assert_equal(false, board.valid_position?(20))
		assert_equal(true, board.valid_position?(7))
		assert_equal(false, board.valid_position?(3))
	end

	def test_for_full_board_false_4_by_4
		board = Board.new(16, 4, 4)
		board.ttt_board = ['O', 'X', 'X', 'O', 'O', 'O', 'X', 'X', 'X', 'X', 'O', 'O', 'O', '', 'X', 'X']
		assert_equal(false, board.full_board?(board))
	end

	def test_for_full_board_true_4_by_4
		board = Board.new(16, 4, 4)
		board.ttt_board = ['O', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O']
		assert_equal(true, board.full_board?(board))
	end

	def test_valid_input_4_by_4
		board = Board.new(16, 4, 4)
		assert_equal(false, board.valid_input?('m'))
		assert_equal(true, board.valid_input?('x'))
		assert_equal(true, board.valid_input?('O'))
		assert_equal(false, board.valid_input?(''))
		assert_equal(false, board.valid_input?('@'))
		assert_equal(true, board.valid_input?('X'))
		assert_equal(true, board.valid_input?('o'))
		assert_equal(false, board.valid_input?('!'))
		assert_equal(false, board.valid_input?('p'))
		assert_equal(false, board.valid_input?('^'))
	end

	def test_for_win_at_positions_0_1_2_3_with_X_4_by_4
		board = Board.new(16, 4, 4)
		marker = 'X'
		board.ttt_board =  ['X', 'X', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'O']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_positions_4_5_6_7_with_O_4_by_4
		board = Board.new(16, 4, 4)
		marker = 'O'
		board.ttt_board = ['X', 'O', 'X', 'X', 'O', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_positions_8_9_10_11_with_X_4_by_4
		board = Board.new(16, 4, 4)
		marker = 'X'
		board.ttt_board = ['O', 'X', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'X', 'O', 'O', 'O', 'X']
		assert_equal(true, board.winner?(marker))
	end

	# def test_for_win_at_positions_3_6_9_12_with_O_4_by_4 (ALTER BOARD.RB WINNER? METHOD)
	# 	board = Board.new(16, 4, 4)
	# 	marker = 'O'
	# 	board.ttt_board = ['X', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'X', 'O']
	# 	assert_equal(true, board.winner?(marker))
	# end

	# def test_winner_with_empties_4_by_4 (ALTER BOARD.RB WINNER? METHOD)
	# 	board = Board.new(16, 4, 4)
	# 	marker = 'X'
	# 	board.ttt_board = ['X', '', 'X', '', 'O', 'O', 'X', '', 'O', 'O', 'X', 'O', '', '', 'X', 'X']
	# 	assert_equal(true, board.winner?(marker))
	# end

	def test_no_winner_with_empties_4_by_4
		board = Board.new(16, 4, 4)
		marker = 'X'
		board.ttt_board = ['X', '', '', 'O', '', 'O', 'X', '', '', 'X', 'O', '', 'O', '', '', 'X']
		assert_equal(false, board.winner?(marker))
	end

	def test_full_board_with_winner_4_by_4
		board = Board.new(16, 4, 4)
		marker = 'O'
		board.ttt_board = ['X', 'O', 'X', 'X', 'O', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X']
		assert_equal(true, board.winner?(marker))
	end
end