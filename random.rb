class RandomAI

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board)
		valid_pos = []

		board.each_with_index do |val, pos|
			if val == ''
				valid_pos.push(pos)
			end
		end
		valid_pos.sample
	end
end