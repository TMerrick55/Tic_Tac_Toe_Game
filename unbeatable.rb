class Unbeatable
require_relative 'board.rb'

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(ttt_board)
		winning_pos = [
					[0, 1, 2], 
					[3, 4, 5], 
					[6, 7, 8], 
					[0, 3, 6], 
					[1, 4, 7], 
					[2, 5, 8], 
					[0, 4, 8], 
					[2, 4, 6]
					]
		# win_array.each do |win|
			board_position =  [
				[ttt_board[0], ttt_board[1], ttt_board[2]],
				[ttt_board[3], ttt_board[4], ttt_board[5]],
				[ttt_board[6], ttt_board[7], ttt_board[8]],
				[ttt_board[0], ttt_board[3], ttt_board[6]],
				[ttt_board[1], ttt_board[4], ttt_board[7]],
				[ttt_board[2], ttt_board[5], ttt_board[8]],
				[ttt_board[0], ttt_board[4], ttt_board[8]],
				[ttt_board[2], ttt_board[4], ttt_board[6]]
								]

				marker_1 = 'X'
				marker_2 = 'O'

				if marker == marker_1
					opponent = marker_2
				else 
					opponent = marker_1
				end

			results = ttt_board.index('')
			board_position.each_with_index do |win_combo, index|


				if win_combo.count(marker) == 2 && win_combo.count('') == 1
					winning_index = win_combo.index('')
					results = winning_pos[index][winning_index]
				elsif win_combo.count(opponent) == 2 && win_combo.count('') == 1
					winning_index = win_combo.index('')
					results = winning_pos[index][winning_index]
				else
					results
				end
			end
			results
	end
end