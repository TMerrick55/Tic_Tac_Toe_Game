class Unbeatable

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(ttt_board)
	
		if get_win(ttt_board) < 9
			# p 'get_win'
			move = get_win(ttt_board)
		elsif 
			get_block(ttt_board) < 9
			# p 'get_block'
			move = get_block(ttt_board)
		elsif
			check_fork(ttt_board) < 9
			# p 'check_fork'
			move = check_fork(ttt_board)
		elsif
			block_fork(ttt_board) < 9
			# p 'block_fork'
			move = block_fork(ttt_board)
		elsif
			take_center(ttt_board) < 9
			# p 'take_center'
			move = take_center(ttt_board)
		elsif
			take_opposite_corner(ttt_board) < 9
			# p 'take_corner'
			move = take_opposite_corner(ttt_board)
		elsif
			take_empty_corner(ttt_board) < 9
			# p 'take_empty_corner'
			move = take_empty_corner(ttt_board)
		elsif
			take_empty_side(ttt_board) < 9
			# p 'take_empty_side'
			move = take_empty_side(ttt_board)		
		end
	end

	def check_fork(ttt_board)
		array_fork = [
					[0, 1, 2], 
					[3, 4, 5], 
					[6, 7, 8], 
					[0, 3, 6], 
					[1, 4, 7], 
					[2, 5, 8], 
					[0, 4, 8], 
					[2, 4, 6]
					]
					
		fork_positions =  [
			[ttt_board[0], ttt_board[1], ttt_board[2]],
			[ttt_board[3], ttt_board[4], ttt_board[5]],
			[ttt_board[6], ttt_board[7], ttt_board[8]],
			[ttt_board[0], ttt_board[3], ttt_board[6]],
			[ttt_board[1], ttt_board[4], ttt_board[7]],
			[ttt_board[2], ttt_board[5], ttt_board[8]],
			[ttt_board[0], ttt_board[4], ttt_board[8]],
			[ttt_board[2], ttt_board[4], ttt_board[6]]
							]

		key = []
		fork_positions.each_with_index do |combo_fork, index_fork|
			if combo_fork.count(marker) == 1 && combo_fork.count('') == 2
				key << index_fork
			end
		end

		fork_squared = []
		key.each do |index|
			fork_squared << array_fork[index]
		end

		array_results = []
		fork_squared = fork_squared.flatten.sort
		fork_squared.each do |square|
			if ttt_board[square] == ''
				array_results << square
			end
		end

		if array_results.find {|combo| array_results.count(combo) > 1} == nil
			move = 9
		else
			move = array_results.find {|combo| array_results.count(combo) > 1}
		end
		move
	end

	def get_win(ttt_board)
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
			
			results = 9

			board_position.each_with_index do |win_combo, index|


				if win_combo.count(marker) == 2 && win_combo.count('') == 1
					winning_index = win_combo.index('')
					results = winning_pos[index][winning_index]
				else
					results
				end

			end
			results
	end

	def get_block(ttt_board)
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

			results = 10

			board_position.each_with_index do |win_combo, index|

				if win_combo.count(opponent) == 2 && win_combo.count('') == 1
					winning_index = win_combo.index('')
					results = winning_pos[index][winning_index]
				else
					results
				end
			end
			results
	end

	def block_fork(ttt_board)
		
		opponent = 'X'

		if marker == 'X'
			opponent = 'O'
		else
			opponent = 'X'
		end

		array_fork = [
			[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
					
		fork_positions =  [
			[ttt_board[0], ttt_board[1], ttt_board[2]],
			[ttt_board[3], ttt_board[4], ttt_board[5]],
			[ttt_board[6], ttt_board[7], ttt_board[8]],
			[ttt_board[0], ttt_board[3], ttt_board[6]],
			[ttt_board[1], ttt_board[4], ttt_board[7]],
			[ttt_board[2], ttt_board[5], ttt_board[8]],
			[ttt_board[0], ttt_board[4], ttt_board[8]],
			[ttt_board[2], ttt_board[4], ttt_board[6]]
							]

		key_2 = []
		fork_positions.each_with_index do |fork_combo, fork_index|
			if fork_combo.count(opponent) == 1 && fork_combo.count('') == 2
				key_2 << fork_index
			end
		end

		fork_squared_2 = []
		key_2.each do |index|
			fork_squared_2 << array_fork[index]
		end

		array_results = []
		fork_squared_2 = fork_squared_2.flatten.sort
		fork_squared_2.each do |square_2|
			if ttt_board[square_2] == ''
				array_results << square_2
			end
		end

		if array_results.find {|combo_2| array_results.count(combo_2) > 1} == nil
			move_2 = 9
		else
			move_2 = array_results.find {|combo_2| array_results.count(combo_2) > 1}
		end
		move_2
	end

	def take_center(ttt_board)
		if ttt_board[4] == ""
			move = 4
		else
			move = 9
		end
	end

	def take_opposite_corner(ttt_board)
		opponent = 'X'

		if marker == 'X'
			opponent = 'O'

		else
			opponent = 'X'
		end

		if ttt_board[0] == opponent && ttt_board[8] == ''
			move = 8
		
		elsif ttt_board[2] == opponent && ttt_board[6] == ''
			move = 6

		elsif ttt_board[6] == opponent && ttt_board[2] == ''
			move = 2

		elsif ttt_board[8] == opponent && ttt_board[0] == ''
			move = 0

		else
			move = 9
		end
		move
	end

	def take_empty_corner(ttt_board)
		
		if ttt_board[0] == ''
			move = 0
		elsif ttt_board[2] == ''
			move = 2
		elsif ttt_board[6] == ''
			move = 6
		elsif ttt_board[8] == ''
			move = 8
		else
			move = 9
		end
		move
	end

	def take_empty_side(ttt_board)
		
		if ttt_board[1] == ''
			results = 1
		elsif ttt_board[3] == ''
			results = 3
		elsif ttt_board[5] == ''
			results = 5
		elsif ttt_board[7] == ''
			results = 7
		else
			results = 9
		end
		results
	end
end