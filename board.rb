class Board
	
	attr_accessor :ttt_board

	# Now when I call a new instance of the board class, I need to pass in the size of the new board in the initialize function. Google how to do so ASAP.
	def initialize(spaces, board_side, length_of_single_side)
		spaces = board_side.to_i * board_side.to_i
		board_side = length_of_single_side
		length_of_single_side = []
		@ttt_board = Array.new(spaces, '')
	end

	def update_position(position, marker)
		ttt_board[position] = marker
	end

	def valid_position?(position)
		if ttt_board[position] == ''
			true
		else
			false
		end
	end

	def full_board?(board)
		if ttt_board.include?('')
			false
		else
			true
		end
	end

	def valid_input?(input)
		if input.match(/[xXoO]/)
			true
		else
			false
		end
	end

	def winner_3_by_3?(marker)
	winner = [
			[0, 1, 2], 
			[3, 4, 5], 
			[6, 7, 8], 
			[0, 3, 6], 
			[1, 4, 7], 
			[2, 5, 8], 
			[0, 4, 8], 
			[2, 4, 6]
		]
		
		results = false
		winner.each do |inner_array|
			count = 0
			inner_array.each do |value|
				if ttt_board[value] == marker
					count += 1
					if count == 3
						results = true
					end
				end
			end
		end
		results
	end

	def winner_4_by_4?(marker)
	winner = [
			[0, 1, 2, 3], 
			[4, 5, 6, 7], 
			[8, 9, 10, 11], 
			[12, 13, 14, 15], 
			[0, 4, 8, 12], 
			[1, 5, 9, 13], 
			[2, 6, 10, 14], 
			[3, 7, 11, 15],
			[0, 5, 10, 15],
			[3, 6, 9, 12]
		]
		
		results = false
		winner.each do |inner_array|
			count = 0
			inner_array.each do |value|
				if ttt_board[value] == marker
					count += 1
					if count == 4
						results = true
					end
				end
			end
		end
		results
	end

	def winner_5_by_5?(marker)
	winner = [
			[0, 1, 2, 3, 4], 
			[5, 6, 7, 8, 9], 
			[10, 11, 12, 13, 14], 
			[15, 16, 17, 18, 19], 
			[20, 21, 22, 23, 24], 
			[0, 5, 10, 15, 20], 
			[1, 6, 11, 16, 21], 
			[2, 7, 12, 17, 22],
			[3, 8, 13, 18, 23],
			[4, 9, 14, 19, 24],
			[0, 6, 12, 18, 24],
			[4, 8, 12, 16, 20]
		]
		
		results = false
		winner.each do |inner_array|
			count = 0
			inner_array.each do |value|
				if ttt_board[value] == marker
					count += 1
					if count == 5
						results = true
					end
				end
			end
		end
		results
	end

	def winner_6_by_6?(marker)
	winner = [
			[0, 1, 2, 3, 4, 5], 
			[6, 7, 8, 9, 10, 11], 
			[12, 13, 14, 15, 16, 17], 
			[18, 19, 20, 21, 22, 23], 
			[24, 25, 26, 27, 28, 29], 
			[30, 31, 32, 33, 34, 35],
			[0, 6, 12, 18, 24, 30], 
			[1, 7, 13, 19, 25, 31], 
			[2, 8, 14, 20, 26, 32],
			[3, 9, 15, 21, 27, 33],
			[4, 10, 16, 22, 28, 34],
			[5, 11, 17, 23, 29, 35],
			[0, 7, 14, 21, 28, 35],
			[5, 10, 15, 20, 25, 30]
		]
		
		results = false
		winner.each do |inner_array|
			count = 0
			inner_array.each do |value|
				if ttt_board[value] == marker
					count += 1
					if count == 6
						results = true
					end
				end
			end
		end
		results
	end

	def winner_7_by_7?(marker)
	winner = [
			[0, 1, 2, 3, 4, 5, 6], 
			[7, 8, 9, 10, 11, 12, 13], 
			[14, 15, 16, 17, 18, 19, 20], 
			[21, 22, 23, 24, 25, 26, 27], 
			[28, 29, 30, 31, 32, 33, 34], 
			[35, 36, 37, 38, 39, 40, 41],
			[42, 43, 44, 45, 46, 47, 48],
			[0, 7, 14, 21, 28, 35, 42], 
			[1, 8, 15, 22, 29, 36, 43], 
			[2, 9, 16, 23, 30, 37, 44],
			[3, 10, 17, 24, 31, 38, 45],
			[4, 11, 18, 25, 32, 39, 46],
			[5, 12, 19, 26, 33, 40, 47],
			[6, 13, 20, 27, 34, 41, 48],
			[0, 8, 16, 24, 32, 40, 48],
			[6, 12, 18, 24, 30, 36, 42]
		]
		
		results = false
		winner.each do |inner_array|
			count = 0
			inner_array.each do |value|
				if ttt_board[value] == marker
					count += 1
					if count == 7
						results = true
					end
				end
			end
		end
		results
	end

end