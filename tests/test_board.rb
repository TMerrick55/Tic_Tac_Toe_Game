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
		assert_equal(true, board.winner_3_by_3?(marker))
	end

	def test_for_win_at_positions_6_7_8_with_O_3_by_3
		board = Board.new(9, 3, 3)
		marker = 'O'
		board.ttt_board = ['X', 'O', 'X', 'O', 'X', 'x', 'O', 'O', 'O']
		assert_equal(true, board.winner_3_by_3?(marker))
	end

	def test_for_win_at_positions_0_4_8_with_X_3_by_3
		board = Board.new(9, 3, 3)
		marker = 'X'
		board.ttt_board = ['X', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'X']
		assert_equal(true, board.winner_3_by_3?(marker))
	end

	def test_for_win_at_positions_2_4_6_with_O_3_by_3
		board = Board.new(9, 3, 3)
		marker = 'O'
		board.ttt_board = ['X', 'X', 'O', 'O', 'O', 'X', 'O', 'X', 'X']
		assert_equal(true, board.winner_3_by_3?(marker))
	end

	def test_winner_with_empties_3_by_3
		board = Board.new(9, 3, 3)
		marker = 'X'
		board.ttt_board = ['X', 'X', 'O', 'X', 'O', '', 'X', 'O', '']
		assert_equal(true, board.winner_3_by_3?(marker))
	end

	def test_no_winner_with_empties_3_by_3
		board = Board.new(9, 3, 3)
		marker = 'X'
		board.ttt_board = ['O', '', 'X', 'X', '', 'O', 'O', '', '']
		assert_equal(false, board.winner_3_by_3?(marker))
	end

	def test_full_board_with_winner_3_by_3
		board = Board.new(9, 3, 3)
		marker = 'O'
		board.ttt_board = ['X', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'O']
		assert_equal(true, board.winner_3_by_3?(marker))
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
		assert_equal(true, board.winner_4_by_4?(marker))
	end

	def test_for_win_at_positions_4_5_6_7_with_O_4_by_4
		board = Board.new(16, 4, 4)
		marker = 'O'
		board.ttt_board = ['X', 'O', 'X', 'X', 'O', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X']
		assert_equal(true, board.winner_4_by_4?(marker))
	end

	def test_for_win_at_positions_8_9_10_11_with_X_4_by_4
		board = Board.new(16, 4, 4)
		marker = 'X'
		board.ttt_board = ['O', 'X', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'X', 'O', 'O', 'O', 'X']
		assert_equal(true, board.winner_4_by_4?(marker))
	end

	def test_for_win_at_positions_3_6_9_12_with_O_4_by_4
		board = Board.new(16, 4, 4)
		marker = 'O'
		board.ttt_board = ['X', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'X', 'O']
		assert_equal(true, board.winner_4_by_4?(marker))
	end

	def test_winner_with_empties_4_by_4
		board = Board.new(16, 4, 4)
		marker = 'X'
		board.ttt_board = ['X', '', 'X', '', 'O', 'O', 'X', '', 'O', 'O', 'X', 'O', '', '', 'X', 'X']
		assert_equal(true, board.winner_4_by_4?(marker))
	end

	def test_no_winner_with_empties_4_by_4
		board = Board.new(16, 4, 4)
		marker = 'X'
		board.ttt_board = ['X', '', '', 'O', '', 'O', 'X', '', '', 'X', 'O', '', 'O', '', '', 'X']
		assert_equal(false, board.winner_4_by_4?(marker))
	end

	def test_full_board_with_winner_4_by_4
		board = Board.new(16, 4, 4)
		marker = 'O'
		board.ttt_board = ['X', 'O', 'X', 'X', 'O', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X']
		assert_equal(true, board.winner_4_by_4?(marker))
	end
end

class Test_Tic_Tac_Toe_markers_5_by_5 < Minitest::Test

	def test_update_first_position_5_by_5
		board = Board.new(25, 5, 5)
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_first_position_X_and_second_O_5_by_5
		board = Board.new(25, 5, 5)
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_partial_board_at_last_position_5_by_5
		board = Board.new(25, 5, 5)
		board.ttt_board = ['X', 'O', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		board.update_position(24, 'X')
		assert_equal(['X', 'O', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'X'], board.ttt_board)
	end

	def test_check_if_position_is_available_5_by_5
		board = Board.new(25, 5, 5)
		board.ttt_board = ['X', 'O', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		assert_equal(true, board.valid_position?(5))
		assert_equal(false, board.valid_position?(0))					
		assert_equal(true, board.valid_position?(15))
		assert_equal(true, board.valid_position?(20))
		assert_equal(false, board.valid_position?(28))
		assert_equal(true, board.valid_position?(7))
		assert_equal(false, board.valid_position?(3))
	end

	def test_for_full_board_false_5_by_5
		board = Board.new(25, 5, 5)
		board.ttt_board = ['X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'X', 'O', 'X', 'O', '', 'O', '', 'X', 'O', 'X']
		assert_equal(false, board.full_board?(board))
	end

	def test_for_full_board_true_5_by_5
		board = Board.new(25, 5, 5)
		board.ttt_board = ['X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X']
		assert_equal(true, board.full_board?(board))
	end

	def test_valid_input_5_by_5
		board = Board.new(25, 5, 5)
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

	def test_for_win_at_positions_0_1_2_3_4_with_X_5_by_5
		board = Board.new(25, 5, 5)
		marker = 'X'
	 	board.ttt_board =  ['X', 'X', 'X', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'X']
		assert_equal(true, board.winner_5_by_5?(marker))
	end

	def test_for_win_at_positions_5_6_7_8_9_with_O_5_by_5
		board = Board.new(25, 5, 5)
		marker = 'O'
	 	board.ttt_board = ['X', 'X', 'X', 'O', 'X', 'O', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'X', 'O']
		assert_equal(true, board.winner_5_by_5?(marker))
	end

	def test_for_win_at_positions_10_11_12_13_14_with_X_5_by_5
		board = Board.new(25, 5, 5)
		marker = 'O'
		board.ttt_board = ['O', 'O', 'X', 'X', 'X', 'X', 'X', 'O', 'X', 'O', 'O', 'O', 'O', 'O', 'O', 'X', 'X', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'X']
		assert_equal(true, board.winner_5_by_5?(marker))
	end

	def test_for_win_at_positions_4_8_12_16_20_with_O_5_by_5
		board = Board.new(25, 5, 5)
		marker = 'O'
	 	board.ttt_board = ['X', 'O', 'O', 'X', 'O', 'O', 'X', 'X', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'X']
		assert_equal(true, board.winner_5_by_5?(marker))
	end

	def test_winner_with_empties_5_by_5
		board = Board.new(25, 5, 5)
		marker = 'O'
		board.ttt_board = ['X', 'X', 'O', 'X', 'O', 'O', 'O', 'O', 'O', 'O', 'X', '', '', 'X', 'X', 'X', '', 'X', 'O', '', 'O', 'O', '', 'X', 'X']
		assert_equal(true, board.winner_5_by_5?(marker))
	end

	def test_no_winner_with_empties_5_by_5
		board = Board.new(25, 5, 5)
		marker = 'O'
		board.ttt_board = ['X', '', '', 'X', 'O', '', 'O', '', '', '', 'X', '', 'O', '', '', '', 'X', '', 'O', '', 'O', '', '', '', 'X']
		assert_equal(false, board.winner_5_by_5?(marker))
	end

	def test_full_board_with_winner_5_by_5
		board = Board.new(25, 5, 5)
		marker = 'X'
	 	board.ttt_board = ['X', 'X', 'O', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'X', 'X', 'X', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'X', 'O', 'O', 'O']
		assert_equal(true, board.winner_5_by_5?(marker))
	end
end

class Test_Tic_Tac_Toe_markers_6_by_6 < Minitest::Test

	def test_update_first_position_6_by_6
		board = Board.new(36, 6, 6)
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_first_position_X_and_second_O_6_by_6
		board = Board.new(36, 6, 6)
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_partial_board_at_last_position_6_by_6
		board = Board.new(36, 6, 6)
		board.ttt_board = ['X', 'O', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'X']
		board.update_position(35, 'X')
		assert_equal(['X', 'O', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'X'], board.ttt_board)
	end

	def test_check_if_position_is_available_6_by_6
		board = Board.new(36, 6, 6)
		board.ttt_board = ['X', 'O', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		assert_equal(true, board.valid_position?(5))
		assert_equal(false, board.valid_position?(0))					
		assert_equal(true, board.valid_position?(15))
		assert_equal(true, board.valid_position?(20))
		assert_equal(true, board.valid_position?(28))
		assert_equal(false, board.valid_position?(40))
		assert_equal(true, board.valid_position?(7))
		assert_equal(false, board.valid_position?(3))
	end

	def test_for_full_board_false_6_by_6
		board = Board.new(36, 6, 6)
		board.ttt_board = ['X', 'X', 'O', '', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', '', '', 'O', 'X', 'O', 'X', 'O', 'X', 'O', '', 'O', 'X', '', 'O', 'X', 'O', '', 'X', 'O']
		assert_equal(false, board.full_board?(board))
	end

	def test_for_full_board_true_6_by_6
		board = Board.new(36, 6, 6)
		board.ttt_board = ['X', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O']
		assert_equal(true, board.full_board?(board))
	end

	def test_valid_input_6_by_6
		board = Board.new(36, 6, 6)
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

	def test_for_win_at_positions_0_1_2_3_4_5_with_X_6_by_6
		board = Board.new(36, 6, 6)
		marker = 'X'
	 	board.ttt_board = ['X', 'X', 'X', 'X', 'X', 'X', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'O', 'O', 'X', 'O', 'X']
		assert_equal(true, board.winner_6_by_6?(marker))
	end

	def test_for_win_at_positions_12_13_14_15_16_17_with_O_6_by_6
		board = Board.new(36, 6, 6)
		marker = 'O'
		board.ttt_board = ['X', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'X', 'X', 'O', 'X', 'O']
		assert_equal(true, board.winner_6_by_6?(marker))
	end

	def test_for_win_at_positions_5_10_15_20_25_30_with_O_6_by_6
		board = Board.new(36, 6, 6)
		marker = 'O'
	 	board.ttt_board = ['X', 'X', '', '', 'X', 'O', '', '', '', 'X', 'O', 'O', '', '', '', 'O', '', '', '', 'X', 'O', 'X', '', '', '', 'O', 'X', '', '', '', 'O', '', 'O', '', '', 'X']
		assert_equal(true, board.winner_6_by_6?(marker))
	end

	def test_winner_with_empties_6_by_6
		board = Board.new(36, 6, 6)
		marker = 'O'
		board.ttt_board = ['O', '', 'X', 'X', '', 'X', 'X', 'O', '', '', 'X', 'X', '', '', 'O', 'O', '', '', '', '', 'X', 'O', '', 'X', '', '', 'O', 'O', 'O', '', 'X', '', '', 'O', 'X', 'O']
		assert_equal(true, board.winner_6_by_6?(marker))
	end

	def test_no_winner_with_empties_6_by_6
		board = Board.new(36, 6, 6)
		marker = 'O'
		board.ttt_board = ['X', '', '', '', '', '', '', 'O', '', '', '', '', '', 'X', 'O', '', '', '', '', '', 'X', 'O', '', '', '', '', 'O', 'X', '', '', '', '', '', '', 'X', 'O']
		assert_equal(false, board.winner_6_by_6?(marker))
	end

	def test_full_board_with_winner_6_by_6
		board = Board.new(36, 6, 6)
		marker = 'O'
	 	board.ttt_board = ['O', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'X', 'O']
		assert_equal(true, board.winner_6_by_6?(marker))
	end
end

class Test_Tic_Tac_Toe_markers_7_by_7 < Minitest::Test

	def test_update_first_position_7_by_7
		board = Board.new(49, 7, 7)
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_first_position_X_and_second_O_7_by_7
		board = Board.new(49, 7, 7)
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_partial_board_at_last_position_7_by_7
		board = Board.new(49, 7, 7)
		board.ttt_board = ['X', 'O', '', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		board.update_position(48, 'X')
		assert_equal(['X', 'O', '', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'X'], board.ttt_board)
	end

	def test_check_if_position_is_available_7_by_7
		board = Board.new(49, 7, 7)
		board.ttt_board = ['X', 'O', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		assert_equal(true, board.valid_position?(5))
		assert_equal(false, board.valid_position?(0))					
		assert_equal(true, board.valid_position?(15))
		assert_equal(true, board.valid_position?(20))
		assert_equal(true, board.valid_position?(28))
		assert_equal(true, board.valid_position?(40))
		assert_equal(false, board.valid_position?(50))
		assert_equal(true, board.valid_position?(7))
		assert_equal(false, board.valid_position?(3))
	end

	def test_for_full_board_true_7_by_7
		board = Board.new(49, 7, 7)
		board.ttt_board = ['X', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'X', 'O', 'O', 'O', 'X', 'X']
		assert_equal(true, board.full_board?(board))
	end

	def test_valid_input_7_by_7
		board = Board.new(49, 7, 7)
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

	def test_for_win_at_positions_0_1_2_3_4_5_6_with_X_7_by_7
		board = Board.new(49, 7, 7)
		marker = 'X'
	 	board.ttt_board = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'O']
		assert_equal(true, board.winner_7_by_7?(marker))
	end

	def test_for_win_at_positions_6_12_18_24_30_36_42_with_O_7_by_7
		board = Board.new(49, 7, 7)
		marker = 'O'
	 	board.ttt_board = ['X', '', 'X', '', 'X', '', 'O', 'O', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'X', '', 'O', '', 'O', '', 'X', 'X', 'O', 'O', 'X', '', 'O', '', 'O', 'O', 'X', '', '', 'X', 'O', 'X', 'X', '', '', 'X', 'O', '', 'O', 'X', 'O', 'X', 'O']
		assert_equal(true, board.winner_7_by_7?(marker))
	end

	def test_winner_with_empties_7_by_7
		board = Board.new(49, 7, 7)
		marker = 'X'
		board.ttt_board = ['O', 'O', 'O', '', 'O', '', 'X', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'O', '', 'X', 'O', 'X', 'O', 'O', 'X', 'X', 'O', '', 'X', '', 'X', 'X', 'O', 'O', '', 'O', 'X', 'X', 'O', '', '', 'O', 'X', 'X', 'X', 'O', 'X', 'O', 'X', '']
		assert_equal(true, board.winner_7_by_7?(marker))
	end

	def test_full_board_with_winner_7_by_7
		board = Board.new(49, 7, 7)
		marker = 'O'
	 	board.ttt_board = ['O', 'X', 'X', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'X', 'X', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'X', 'O', 'X', 'O', 'X']
		assert_equal(true, board.winner_7_by_7?(marker))
	end
end

class Test_Tic_Tac_Toe_markers_8_by_8 < Minitest::Test

	def test_update_first_position_8_by_8
		board = Board.new(64, 8, 8)
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_first_position_X_and_second_O_8_by_8
		board = Board.new(64, 8, 8)
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_partial_board_at_last_position_8_by_8
		board = Board.new(64, 8, 8)
		board.ttt_board = ['X', 'O', '', '', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		board.update_position(63, 'X')
		assert_equal(['X', 'O', '', '', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'X'], board.ttt_board)
	end

	def test_check_if_position_is_available_8_by_8
		board = Board.new(64, 8, 8)
		board.ttt_board = ['X', 'O', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		assert_equal(true, board.valid_position?(5))
		assert_equal(false, board.valid_position?(0))
		assert_equal(true, board.valid_position?(15))
		assert_equal(true, board.valid_position?(20))
		assert_equal(true, board.valid_position?(28))
		assert_equal(true, board.valid_position?(40))
		assert_equal(true, board.valid_position?(50))
		assert_equal(false, board.valid_position?(65))
		assert_equal(true, board.valid_position?(7))
		assert_equal(false, board.valid_position?(3))
	end

	def test_for_full_board_true_8_by_8
		board = Board.new(64, 8, 8)
		board.ttt_board = ['X', 'O', '', 'X', '', '', '', 'O', 'O', '', 'X', 'O', '', 'X', '', 'O', 'O', 'X', 'X', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'O', 'X', '', 'O', '', '', '', 'X', 'X', '', 'X', 'X', 'O', 'X', 'O', 'O', 'O', '', 'O', '', 'O', '', '', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X']
		assert_equal(false, board.full_board?(board))
	end

	def test_valid_input_8_by_8
		board = Board.new(64, 8, 8)
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

	def test_for_win_at_positions_8_9_10_11_12_13_14_15_with_X_8_by_8
		board = Board.new(64, 8, 8)
		marker = 'X'
	 	board.ttt_board = ['O', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'O']
		assert_equal(true, board.winner_8_by_8?(marker))
	end

	def test_for_win_at_positions_7_14_21_28_35_42_49_56_with_O_8_by_8
		board = Board.new(64, 8, 8)
		marker = 'O'
	 	board.ttt_board = ['', 'X', 'O', '', '', '', '', 'O', 'O', 'X', '', '', '', '', 'O', 'X', '', 'O', '', 'O', '', 'O', '', '', '', 'X', 'X', 'X', 'O', 'X', '', 'O', 'X', '', '', 'O', '', '', 'X', '', '', 'X', 'O', 'X', 'O', '', '', 'X', '', 'O', '', '', 'X', '', '', '', 'O', 'X', '', '', '', '', '', '']
		assert_equal(true, board.winner_8_by_8?(marker))
	end

	def test_winner_with_empties_8_by_8
		board = Board.new(64, 8, 8)
		marker = 'X'
		board.ttt_board = ['O', '', 'X', 'O', 'O', '', 'O', '', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'O', '', 'O', 'X', 'O', 'X', '', 'O', '', '', 'X', '', 'O', '', 'O', 'X', 'X', 'O', 'O', 'X', '', 'X', 'O', 'O', '', '', 'O', '', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', '', 'O', '', 'O', 'O', 'X', '', '', 'X', '', 'O']
		assert_equal(true, board.winner_8_by_8?(marker))
	end

	def test_full_board_with_winner_8_by_8
		board = Board.new(64, 8, 8)
		marker = 'O'
	 	board.ttt_board = ['X', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'X', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'X']
		assert_equal(true, board.winner_8_by_8?(marker))
	end
end

class Test_Tic_Tac_Toe_markers_9_by_9 < Minitest::Test

	def test_update_first_position_9_by_9
		board = Board.new(81, 9, 9)
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_first_position_X_and_second_O_9_by_9
		board = Board.new(81, 9, 9)
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_partial_board_at_last_position_9_by_9
		board = Board.new(81, 9, 9)
		board.ttt_board = ['X', 'O', '', '', '', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'X']
		board.update_position(80, 'X')
		assert_equal(['X', 'O', '', '', '', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'X'], board.ttt_board)
	end

	def test_check_if_position_is_available_9_by_9
		board = Board.new(81, 9, 9)
		board.ttt_board = ['X', 'O', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		assert_equal(true, board.valid_position?(5))
		assert_equal(false, board.valid_position?(0))
		assert_equal(true, board.valid_position?(15))
		assert_equal(true, board.valid_position?(20))
		assert_equal(true, board.valid_position?(28))
		assert_equal(true, board.valid_position?(40))
		assert_equal(true, board.valid_position?(50))
		assert_equal(true, board.valid_position?(65))
		assert_equal(false, board.valid_position?(84))
		assert_equal(true, board.valid_position?(7))
		assert_equal(false, board.valid_position?(3))
	end

	def test_for_full_board_false_9_by_9
		board = Board.new(81, 9, 9)
		board.ttt_board = ['X', 'O', '', 'X', '', '', '', 'O', 'O', '', 'X', 'O', '', 'X', '', 'O', 'O', 'X', 'X', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'O', 'X', '', 'O', '', '', '', 'X', 'X', '', 'X', 'X', 'O', 'X', 'O', 'O', 'O', '', 'O', '', 'O', '', '', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', '', 'X', 'X']
		assert_equal(false, board.full_board?(board))
	end

	def test_valid_input_9_by_9
		board = Board.new(81, 9, 9)
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

	def test_for_win_at_positions_72_73_74_75_76_77_78_79_80_with_X_9_by_9
		board = Board.new(81, 9, 9)
		marker = 'X'
	 	board.ttt_board = ['O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'X', 'X', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
		assert_equal(true, board.winner_9_by_9?(marker))
	end

	def test_for_win_at_positions_0_10_20_30_40_50_60_70_80_with_X_9_by_9
		board = Board.new(81, 9, 9)
		marker = 'X'
	 	board.ttt_board = ['X', '', 'O', 'X', '', 'X', '', 'O', 'X', 'X', 'X', 'O', 'O', '', 'X', 'O', '', 'O', '', '', 'X', '', 'O', '', '', '', 'O', 'O', '', '', 'X', 'X', 'O', '', 'X', '', 'X', 'X', '', '', 'X', 'O', '', '', 'O', '', '', '', 'X', 'O', 'X', '', 'O', 'X', 'O', 'O', 'O', '', 'X', 'O', 'X', 'O', '', '', 'X', 'X', 'O', '', 'X', 'O', 'X', '', 'O', '', 'O', 'X', 'O', '', 'O', '', 'X']
		assert_equal(true, board.winner_9_by_9?(marker))
	end

	def test_winner_with_empties_9_by_9
		board = Board.new(81, 9, 9)
		marker = 'O'
		board.ttt_board = ['O', '', 'X', 'O', '', 'O', '', 'X', 'O', 'O', 'O', 'X', 'X', '', 'O', 'X', '', 'X', '', '', 'O', '', 'X', '', '', '', 'X', 'X', '', '', 'O', 'O', 'X', '', 'O', '', 'O', 'O', '', '', 'O', 'X', '', '', 'X', '', '', '', 'O', 'X', 'O', '', 'X', 'O', 'X', 'X', 'X', '', 'O', 'X', 'O', 'X', '', '', 'O', 'O', 'X', '', 'O', 'X', 'O', '', 'X', '', 'X', 'O', 'X', '', 'X', '', 'O']
		assert_equal(true, board.winner_9_by_9?(marker))
	end

	def test_full_board_with_winner_9_by_9
		board = Board.new(81, 9, 9)
		marker = 'O'
	 	board.ttt_board = ['X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O']
		assert_equal(true, board.winner_9_by_9?(marker))
	end
end

class Test_Tic_Tac_Toe_markers_10_by_10 < Minitest::Test

	def test_update_first_position_10_by_10
		board = Board.new(100, 10, 10)
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_first_position_X_and_second_O_10_by_10
		board = Board.new(100, 10, 10)
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_partial_board_at_last_position_10_by_10
		board = Board.new(100, 10, 10)
		board.ttt_board = ['X', 'O', '', '', '', '', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		board.update_position(99, 'X')
		assert_equal(['X', 'O', '', '', '', '', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'X'], board.ttt_board)
	end

	def test_check_if_position_is_available_10_by_10
		board = Board.new(100, 10, 10)
		board.ttt_board = ['X', 'O', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		assert_equal(true, board.valid_position?(5))
		assert_equal(false, board.valid_position?(0))
		assert_equal(true, board.valid_position?(15))
		assert_equal(true, board.valid_position?(20))
		assert_equal(true, board.valid_position?(28))
		assert_equal(true, board.valid_position?(40))
		assert_equal(true, board.valid_position?(50))
		assert_equal(true, board.valid_position?(65))
		assert_equal(true, board.valid_position?(84))
		assert_equal(false, board.valid_position?(105))
		assert_equal(true, board.valid_position?(7))
		assert_equal(false, board.valid_position?(3))
	end

	def test_for_full_board_false_10_by_10
		board = Board.new(100, 10, 10)
		board.ttt_board = ['X', '', '', 'O', '', 'O', 'X', 'O', '', 'O', '', 'O', '', '', '', '', 'O', '', '', '', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'O', '', '', 'O', 'O', 'X', 'X', 'O', 'X', 'O', '', '', 'O', 'X', 'X', 'O', '', '', 'X', '', '', 'X', 'X', 'O', '', '', '', 'O', '', 'X', 'X', '', 'O', 'X', '', 'X', 'O', '', '', '', '', '', '', '', '', 'O', '', '', 'X', '', '', '', 'O', '', 'O', '', '', 'O', '', '', 'O', '', '', 'O', '', '', 'O', '', '', 'O']
		assert_equal(false, board.full_board?(board))
	end

	def test_valid_input_10_by_10
		board = Board.new(100, 10, 10)
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

	def test_for_win_at_positions_20_21_22_23_24_25_26_27_28_29_with_X_10_by_10
		board = Board.new(100, 10, 10)
		marker = 'X'
	 	board.ttt_board = ['X', '', '', 'O', '', 'O', 'X', 'O', '', 'O', '', 'O', '', '', '', '', 'O', '', '', '', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'O', '', '', 'O', 'O', 'X', 'X', 'O', 'X', 'O', '', '', 'O', 'X', 'X', 'O', '', '', 'X', '', '', 'X', 'X', 'O', '', '', '', 'O', '', 'X', 'X', '', 'O', 'X', '', 'X', 'O', '', '', '', '', '', '', '', '', 'O', '', '', 'X', '', '', '', 'O', '', 'O', '', '', 'O', '', '', 'O', '', '', 'O', '', '', 'O', '', '', 'O']
		assert_equal(true, board.winner_10_by_10?(marker))
	end

	def test_for_win_at_positions_0_11_22_33_44_55_66_77_88_99_with_X_10_by_10
		board = Board.new(100, 10, 10)
		marker = 'X'
	 	board.ttt_board = ['X', '', '', 'X', '', '', '', '', '', 'O', 'O', 'X', '', '', '', 'O', '', 'O', 'X', '', '', 'O', 'X', '', 'X', 'O', '', '', 'O', '', 'O', 'X', 'O', 'X', '', 'X', 'X', '', '', '', '', '', 'X', '', 'X', 'O', 'O', 'X', '', 'O', 'O', 'X', '', 'O', '', 'X', 'O', 'X', 'O', '', 'X', 'O', 'O', '', '', '', 'X', 'X', 'O', 'X', '', 'X', '', 'X', 'O', 'O', 'O', 'X', '', 'O', 'O', '', '', 'O', '', '', 'O', '', 'X', '', 'X', 'O', '', 'X', 'O', 'X', '', 'X', 'X', 'X']
		assert_equal(true, board.winner_10_by_10?(marker))
	end

	def test_winner_with_empties_10_by_10
		board = Board.new(100, 10, 10)
		marker = 'X'
		board.ttt_board = ['X', '', '', 'X', '', '', '', '', '', 'O', 'O', 'X', '', '', '', 'O', '', 'O', 'X', '', '', 'O', 'X', '', 'X', 'O', '', '', 'O', '', 'O', 'X', 'O', 'X', '', 'X', 'X', '', '', '', '', '', 'X', '', 'X', 'O', 'O', 'X', '', 'O', 'O', 'X', '', 'O', '', 'X', 'O', 'X', 'O', '', 'X', 'O', 'O', '', '', '', 'X', 'X', 'O', 'X', '', 'X', '', 'X', 'O', 'O', 'O', 'X', '', 'O', 'O', '', '', 'O', '', '', 'O', '', 'X', '', 'X', 'O', '', 'X', 'O', 'X', '', 'X', 'X', 'X']
		assert_equal(true, board.winner_10_by_10?(marker))
	end

	def test_full_board_with_winner_10_by_10
		board = Board.new(100, 10, 10)
		marker = 'X'
	 	board.ttt_board = ['X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X']
		assert_equal(true, board.winner_10_by_10?(marker))
	end
end

class Test_Tic_Tac_Toe_markers_11_by_11 < Minitest::Test

	def test_update_first_position_11_by_11
		board = Board.new(121, 11, 11)
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_first_position_X_and_second_O_11_by_11
		board = Board.new(121, 11, 11)
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_partial_board_at_last_position_11_by_11
		board = Board.new(121, 11, 11)
		board.ttt_board = ['X', 'O', '', '', '', '', '', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		board.update_position(120, 'X')
		assert_equal(['X', 'O', '', '', '', '', '', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'X'], board.ttt_board)
	end

	def test_check_if_position_is_available_11_by_11
		board = Board.new(121, 11, 11)
		board.ttt_board = ['X', 'O', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		assert_equal(true, board.valid_position?(5))
		assert_equal(false, board.valid_position?(0))
		assert_equal(true, board.valid_position?(15))
		assert_equal(true, board.valid_position?(20))
		assert_equal(true, board.valid_position?(28))
		assert_equal(true, board.valid_position?(40))
		assert_equal(true, board.valid_position?(50))
		assert_equal(true, board.valid_position?(65))
		assert_equal(true, board.valid_position?(84))
		assert_equal(true, board.valid_position?(105))
		assert_equal(false, board.valid_position?(124))
		assert_equal(true, board.valid_position?(7))
		assert_equal(false, board.valid_position?(3))
	end

	def test_for_full_board_false_11_by_11
		board = Board.new(121, 11, 11)
		board.ttt_board = ['', '', '', '', '', 'X', '', '', 'O', '', 'X', '', '', '', 'O', '', '', 'O', '', 'X', 'X', '', 'O', '', '', '', '', 'X', '', '', 'X', '', '', '', 'X', 'O', 'X', '', '', '', 'X', 'O', '', '', '', 'O', '', 'O', 'X', 'O', 'X', '', '', 'X', 'O', 'O', '', 'O', 'X', '', 'X', 'O', '', '', 'O', '', '', 'X', '', 'O', 'X', 'O', '', 'X', '', '', '', '', 'O', '', 'X', 'O', 'X', '', 'O', '', 'X', '', '', 'O', 'X', 'X', 'O', 'X', '', '', 'O', '', '', 'O', 'X', '', '', '', '', '', 'O', 'X', 'O', '', 'X', '', '', 'O', '', '', 'X', '', 'O', '', '']
		assert_equal(false, board.full_board?(board))
	end

	def test_valid_input_11_by_11
		board = Board.new(121, 11, 11)
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

	def test_for_win_at_positions_10_20_30_40_50_60_70_80_90_100_110_with_X_11_by_11
		board = Board.new(121, 11, 11)
		marker = 'X'
	 	board.ttt_board = ['', '', '', '', '', 'X', '', '', 'O', '', 'X', '', '', '', 'O', '', '', 'O', '', 'X', 'X', '', 'O', '', '', '', '', 'X', '', '', 'X', '', '', '', 'X', 'O', 'X', '', '', '', 'X', 'O', '', '', '', 'O', '', 'O', 'X', 'O', 'X', '', '', 'X', 'O', 'O', '', 'O', 'X', '', 'X', 'O', '', '', 'O', '', '', 'X', '', 'O', 'X', 'O', '', 'X', '', '', '', '', 'O', '', 'X', 'O', 'X', '', 'O', '', 'X', '', '', 'O', 'X', 'X', 'O', 'X', '', '', 'O', '', '', 'O', 'X', '', '', '', '', '', 'O', 'X', 'O', '', 'X', '', '', 'O', '', '', 'X', '', 'O', '', '']
		assert_equal(true, board.winner_11_by_11?(marker))
	end

	def test_for_win_at_positions_4_15_26_37_48_59_70_81_92_103_114_with_X_11_by_11
		board = Board.new(121, 11, 11)
		marker = 'X'
	 	board.ttt_board = ['O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'O', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O']
		assert_equal(true, board.winner_11_by_11?(marker))
	end

	def test_winner_with_empties_11_by_11
		board = Board.new(121, 11, 11)
		marker = 'X'
		board.ttt_board = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'O', '', 'O', 'O', '', 'O', '', '', '', '', 'O', '', '', 'X', '', 'O', 'X', 'O', 'O', 'X', 'O', '', '', 'O', '', 'O', 'X', 'O', 'X', 'O', 'X', 'O', '', '', 'X', 'X', '', 'O', 'O', '', '', 'X', '', '', '', 'O', 'O', 'O', 'X', '', 'O', '', 'O', 'X', '', 'X', '', 'X', '', '', 'X', '', 'X', '', '', '', '', 'O', 'X', 'O', 'O', 'O', '', '', 'O', '', '', '', '', 'O', 'O', 'X', '', 'X', '', 'O', 'X', '', '', 'X', '', '', 'O', '', 'O', 'X', 'O', '', '', 'O', '', '', 'X', '', '', '', '', '', '', '']
		assert_equal(true, board.winner_11_by_11?(marker))
	end

	def test_full_board_with_winner_11_by_11
		board = Board.new(121, 11, 11)
		marker = 'X'
	 	board.ttt_board = ['O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'O', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O']
		assert_equal(true, board.winner_11_by_11?(marker))
	end
end

class Test_Tic_Tac_Toe_markers_12_by_12 < Minitest::Test

	def test_update_first_position_12_by_12
		board = Board.new(144, 12, 12)
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_first_position_X_and_second_O_12_by_12
		board = Board.new(144, 12, 12)
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_partial_board_at_last_position_12_by_12
		board = Board.new(144, 12, 12)
		board.ttt_board = ['X', 'O', '', '', '', '', '', '', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		board.update_position(143, 'X')
		assert_equal(['X', 'O', '', '', '', '', '', '', '', '', '', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'X'], board.ttt_board)
	end

	def test_check_if_position_is_available_12_by_12
		board = Board.new(144, 12, 12)
		board.ttt_board = ['X', 'O', '', 'O', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
		assert_equal(true, board.valid_position?(5))
		assert_equal(false, board.valid_position?(0))
		assert_equal(true, board.valid_position?(15))
		assert_equal(true, board.valid_position?(20))
		assert_equal(true, board.valid_position?(28))
		assert_equal(true, board.valid_position?(40))
		assert_equal(true, board.valid_position?(50))
		assert_equal(true, board.valid_position?(65))
		assert_equal(true, board.valid_position?(84))
		assert_equal(true, board.valid_position?(105))
		assert_equal(true, board.valid_position?(124))
		assert_equal(false, board.valid_position?(145))
		assert_equal(true, board.valid_position?(7))
		assert_equal(false, board.valid_position?(3))
	end

	def test_for_full_board_false_12_by_12
		board = Board.new(144, 12, 12)
		board.ttt_board = ['X', 'O', '', 'O', '', '', '', 'O', '', '', 'O', 'X', '', '', 'X', '', '', '', '', 'O', 'X', '', '', '', 'X', '', '', '', '', '', '', 'X', '', '', '', 'O', '', '', 'X', '', 'O', '', '', 'X', '', 'O', '', '', '', 'X', '', '', 'O', '', 'X', '', '', '', '', 'O', '', '', '', '', '', '', '', 'O', '', '', 'X', 'O', '', '', 'X', '', '', '', '', '', 'O', '', '', '', 'X', '', '', 'X', '', '', 'O', '', '', 'X', '', '', 'O', '', '', '', '', '', 'X', '', 'O', '', '', '', '', 'X', '', '', '', '', 'O', '', '', '', 'X', '', 'O', '', '', '', 'X', '', 'O', '', 'O', '', 'X', '', '', '', 'X', '', '', '', '', 'X', '', '', '', 'O']
		assert_equal(false, board.full_board?(board))
	end

	def test_valid_input_12_by_12
		board = Board.new(144, 12, 12)
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

	def test_for_win_at_positions_0_1_2_3_4_5_6_7_8_9_10_11_with_X_12_by_12
		board = Board.new(144, 12, 12)
		marker = 'X'
	 	board.ttt_board = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'O', 'O', 'O', 'X', 'O']
		assert_equal(true, board.winner_12_by_12?(marker))
	end

	def test_for_win_at_positions_11_22_33_44_55_66_77_88_99_110_121_132_with_X_12_by_12
		board = Board.new(144, 12, 12)
		marker = 'O'
	 	board.ttt_board = ['X', '', 'X', '', 'O', '', 'O', '', 'O', 'X', '', 'O', '', 'O', '', '', '', '', 'X', 'O', '', '', 'O', 'X', 'O', '', 'O', 'X', 'X', '', 'O', '', '', 'O', '', 'O', 'X', '', 'X', '', 'O', '', '', 'X', 'O', '', 'O', 'X', '', 'X', 'X', 'O', 'X', '', '', 'O', '', 'X', '', '', '', '', '', '', 'O', '', 'O', '', '', 'O', 'X', '', 'X', '', 'X', '', 'X', 'O', '', '', 'X', '', '', '', '', 'O', '', '', 'O', '', '', 'X', 'O', '', '', 'X', '', 'X', '', 'O', '', 'X', '', 'O', '', '', '', '', '', '', 'O', '', '', 'O', '', '', 'X', '', 'O', 'O', 'X', 'O', '', '', '', '', 'X', 'O', '', '', '', '', 'O', '', 'X', '', 'X', 'X', '', '', 'X', '', '', 'X']
		assert_equal(true, board.winner_12_by_12?(marker))
	end

	def test_winner_with_empties_12_by_12
		board = Board.new(144, 12, 12)
		marker = 'O'
		board.ttt_board = ['X', '', 'X', '', 'O', '', 'O', '', 'O', 'X', '', 'O', '', 'O', '', '', '', '', 'X', 'O', '', '', 'O', 'X', 'O', '', 'O', 'X', 'X', '', 'O', '', '', 'O', '', 'O', 'X', '', 'X', '', 'O', '', '', 'X', 'O', '', 'O', 'X', '', 'X', 'X', 'O', 'X', '', '', 'O', '', 'X', '', '', '', '', '', '', 'O', '', 'O', '', '', 'O', 'X', '', 'X', '', 'X', '', 'X', 'O', '', '', 'X', '', '', '', '', 'O', '', '', 'O', '', '', 'X', 'O', '', '', 'X', '', 'X', '', 'O', '', 'X', '', 'O', '', '', '', '', '', '', 'O', '', '', 'O', '', '', 'X', '', 'O', 'O', 'X', 'O', '', '', '', '', 'X', 'O', '', '', '', '', 'O', '', 'X', '', 'X', 'X', '', '', 'X', '', '', 'X']
		assert_equal(true, board.winner_12_by_12?(marker))
	end

	def test_full_board_with_winner_12_by_12
		board = Board.new(144, 12, 12)
		marker = 'X'
	 	board.ttt_board = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'O', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'O', 'O', 'X', 'X', 'X', 'O', 'O', 'O', 'O', 'O', 'X', 'O']
		assert_equal(true, board.winner_12_by_12?(marker))
	end
end