class Sequential

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board_state)
		board_state.index('')
	end
end