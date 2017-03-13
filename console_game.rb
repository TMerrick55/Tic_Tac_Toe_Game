require_relative 'board.rb'
require_relative 'human.rb'
require_relative 'sequential.rb'
require_relative 'random.rb'
require_relative 'unbeatable.rb'

class Console_Game

		attr_accessor :p1, :p2, :board, :active_player, :move

	def initialize(p1, p2)
		@p1 = p1
		@p2 = p2
		@board = Board.new
		@active_player = p1
	end

	def intro_ttt
		puts 'Welcome to Tic-Tac-Toe!'
	end

	def create_board
		if check_winner == true || board.full_board?(board)
			p 'Game Over!'
		else
			p "It's #{active_player.marker}'s turn."
		end

	  puts " #{board.ttt_board[0]} | #{board.ttt_board[1]} | #{board.ttt_board[2]} "
	  puts "--------"
	  puts " #{board.ttt_board[3]} | #{board.ttt_board[4]} | #{board.ttt_board[5]} "
	  puts "--------"
	  puts " #{board.ttt_board[6]} | #{board.ttt_board[7]} | #{board.ttt_board[8]} "
	  puts "                                                                       "
	  # puts "It's #{active_player.marker}'s turn"
	  puts "                                                                       "
	end

	def get_move
		@move = active_player.get_move(board.ttt_board)
		# p active_player.marker
	end

	def update_position
		marker = active_player.marker
		if board.valid_position?(@move)
			board.update_position(@move, marker)
		else
			puts "invalid position, please choose again"
			get_move
			update_position
		end
	end

	def change_player
		if active_player == p1
			@active_player = p2
		else
			@active_player = p1
		end
		active_player
	end

	def check_winner
		if board.winner?(active_player.marker)
			true
		else
			false
		end
	end

	def check_tie
		if board.full_board?(board)
			true
		else
			false
		end
	end
end