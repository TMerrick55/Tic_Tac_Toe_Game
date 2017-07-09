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

	def winner?(marker)
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
end