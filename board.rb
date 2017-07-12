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

	def winner_8_by_8?(marker)
	winner = [
			[0, 1, 2, 3, 4, 5, 6, 7], 
			[8, 9, 10, 11, 12, 13, 14, 15], 
			[16, 17, 18, 19, 20, 21, 22, 23], 
			[24, 25, 26, 27, 28, 29, 30, 31], 
			[32, 33, 34, 35, 36, 37, 38, 39], 
			[40, 41, 42, 43, 44, 45, 46, 47],
			[48, 49, 50, 51, 52, 53, 54, 55],
			[56, 57, 58, 59, 60, 61, 62, 63],
			[0, 8, 16, 24, 32, 40, 48, 56], 
			[1, 9, 17, 25, 33, 41, 49, 57], 
			[2, 10, 18, 26, 34, 42, 50, 58],
			[3, 11, 19, 27, 35, 43, 51, 59],
			[4, 12, 20, 28, 36, 44, 52, 60],
			[5, 13, 21, 29, 37, 45, 53, 61],
			[6, 14, 22, 30, 38, 46, 54, 62],
			[7, 15, 23, 31, 39, 47, 55, 63],
			[0, 9, 18, 27, 36, 45, 54, 63],
			[7, 14, 21, 28, 35, 42, 49, 56]
		]
		
		results = false
		winner.each do |inner_array|
			count = 0
			inner_array.each do |value|
				if ttt_board[value] == marker
					count += 1
					if count == 8
						results = true
					end
				end
			end
		end
		results
	end

	def winner_9_by_9?(marker)
	winner = [
			[0, 1, 2, 3, 4, 5, 6, 7, 8], 
			[9, 10, 11, 12, 13, 14, 15, 16, 17], 
			[18, 19, 20, 21, 22, 23, 24, 25, 26],
			[27, 28, 29, 30, 31, 32, 33, 34, 35],
			[36, 37, 38, 39, 40, 41, 42, 43, 44],
			[45, 46, 47, 48, 49, 50, 51, 52, 53],
			[54, 55, 56, 57, 58, 59, 60, 61, 62],
			[63, 64, 65, 66, 67, 68, 69, 70, 71],
			[72, 73, 74, 75, 76, 77, 78, 79, 80],
			[0, 9, 18, 27, 36, 45, 54, 63, 72],
			[1, 10, 19, 28, 37, 46, 55, 64, 73],
			[2, 11, 20, 29, 38, 47, 56, 65, 74],
			[3, 12, 21, 30, 39, 48, 57, 66, 75],
			[4, 13, 22, 31, 40, 49, 58, 67, 76],
			[5, 14, 23, 32, 41, 50, 59, 68, 77],
			[6, 15, 24, 33, 42, 51, 60, 69, 78],
			[7, 16, 25, 34, 43, 52, 61, 70, 79],
			[8, 17, 26, 35, 44, 53, 62, 71, 80],
			[0, 10, 20, 30, 40, 50, 60, 70, 80],
			[8, 16, 24, 32, 40, 48, 56, 64, 72]
		]
		
		results = false
		winner.each do |inner_array|
			count = 0
			inner_array.each do |value|
				if ttt_board[value] == marker
					count += 1
					if count == 9
						results = true
					end
				end
			end
		end
		results
	end

	def winner_10_by_10?(marker)
	winner = [
			[0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 
			[10, 11, 12, 13, 14, 15, 16, 17, 18, 19], 
			[20, 21, 22, 23, 24, 25, 26, 27, 28, 29],
			[30, 31, 32, 33, 34, 35, 36, 37, 38, 39],
			[40, 41, 42, 43, 44, 45, 46, 47, 48, 49],
			[50, 51, 52, 53, 54, 55, 56, 57, 58, 59],
			[60, 61, 62, 63, 64, 65, 66, 67, 68, 69],
			[70, 71, 72, 73, 74, 75, 76, 77, 78, 79],
			[80, 81, 82, 83, 84, 85, 86, 87, 88, 89],
			[90, 91, 92, 93, 94, 95, 96, 97, 98, 99],
			[0, 10, 20, 30, 36, 50, 60, 70, 80, 90],
			[1, 11, 21, 31, 37, 51, 61, 71, 81, 91],
			[2, 12, 22, 32, 38, 52, 62, 72, 82, 92],
			[3, 13, 23, 33, 39, 53, 63, 73, 83, 93],
			[4, 14, 24, 34, 40, 54, 64, 74, 84, 94],
			[5, 15, 25, 35, 41, 55, 65, 75, 85, 95],
			[6, 16, 26, 36, 42, 56, 66, 76, 86, 96],
			[7, 17, 27, 37, 43, 57, 67, 77, 87, 97],
			[8, 18, 28, 38, 44, 58, 68, 78, 88, 98],
			[9, 19, 29, 39, 49, 59, 69, 79, 89, 99]
			[0, 11, 22, 33, 44, 55, 66, 77, 88, 99],
			[9, 18, 27, 36, 45, 54, 63, 72, 81, 90]
		]
		
		results = false
		winner.each do |inner_array|
			count = 0
			inner_array.each do |value|
				if ttt_board[value] == marker
					count += 1
					if count == 10
						results = true
					end
				end
			end
		end
		results
	end

	def winner_11_by_11?(marker)
	winner = [
			[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 
			[11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21], 
			[22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32],
			[33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43],
			[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54],
			[55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65],
			[66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76],
			[77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87],
			[88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98],
			[99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109],
			[110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120],
			[0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110],
			[1, 12, 23, 34, 45, 56, 67, 78, 89, 100, 111],
			[2, 13, 24, 35, 46, 57, 68, 79, 90, 101, 112],
			[3, 14, 25, 36, 47, 58, 69, 80, 91, 102, 113],
			[4, 15, 26, 37, 48, 59, 70, 81, 92, 103, 114],
			[5, 16, 27, 38, 49, 60, 71, 82, 93, 104, 115],
			[6, 17, 28, 39, 50, 61, 72, 83, 94, 105, 116], 
			[7, 18, 29, 40, 51, 62, 73, 84, 95, 106, 117],
			[8, 19, 30, 41, 52, 63, 74, 85, 96, 107, 118],
			[9, 20, 31, 42, 53, 64, 75, 86, 97, 108, 119],
			[10, 21, 32, 43, 54, 65, 76, 87, 98, 109, 120],
			[0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120],
			[10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110]
		]
		
		results = false
		winner.each do |inner_array|
			count = 0
			inner_array.each do |value|
				if ttt_board[value] == marker
					count += 1
					if count == 11
						results = true
					end
				end
			end
		end
		results
	end

	def winner_12_by_12?(marker)
	winner = [
			[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
			[12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23],
			[24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35],
			[36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47],
			[48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59],
			[60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71],
			[72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83],
			[84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95],
			[96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107],
			[108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119],
			[120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131],
			[132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143],
			[0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120, 132],
			[1, 13, 25, 37, 49, 61, 73, 85, 97, 109, 121, 133],
			[2, 14, 26, 38, 50, 62, 74, 86, 98, 110, 122, 134],
			[3, 15, 27, 39, 51, 63, 75, 87, 99, 111, 123, 135],
			[4, 16, 28, 40, 52, 64, 76, 88, 100, 112, 124, 136],
			[5, 17, 29, 41, 53, 65, 77, 89, 101, 113, 125, 137],
			[6, 18, 30, 42, 54, 66, 78, 90, 102, 114, 126, 138], 
			[7, 19, 31, 43, 55, 67, 79, 91, 103, 115, 127, 139],
			[8, 20, 32, 44, 56, 68, 80, 92, 104, 116, 128, 140],
			[9, 21, 33, 45, 57, 69, 81, 93, 105, 117, 129, 141],
			[10, 22, 34, 46, 58, 70, 82, 93, 106, 118, 130, 142],
			[11, 23, 35, 47, 59, 71, 83, 95, 107, 119, 131, 143],
			[0, 13, 26, 39, 52, 65, 78, 91, 104, 117, 130, 143],
			[11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132]
		]
		
		results = false
		winner.each do |inner_array|
			count = 0
			inner_array.each do |value|
				if ttt_board[value] == marker
					count += 1
					if count == 12
						results = true
					end
				end
			end
		end
		results
	end

end