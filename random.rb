class Random

	attr_reader :marker

	def initialize(marker)
		@marker=marker
	end

	def get_move(board)
		board.each_index.select{ |empty| board[empty] == ''}.sample
	end
end