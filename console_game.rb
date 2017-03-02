require_relative 'board.rb'
require_relative 'random.rb'

class Console_Game

		attr_accessor :board, :p1, :p2, :active_player

	def initialize(p1, p2)
		@p1 = p1
		@p2 = p2
		@board = Board.new
		@active_player = p1
	end

	def intro_ttt
		puts 'Welcome to Tic_Tac_Toe'
	end

	def create_board
	  puts " #{board.ttt_board[0]} | #{board.ttt_board[1]} | #{board.ttt_board[2]} "
	  puts "--------"
	  puts " #{board.ttt_board[3]} | #{board.ttt_board[4]} | #{board.ttt_board[5]} "
	  puts "--------"
	  puts " #{board.ttt_board[6]} | #{board.ttt_board[7]} | #{board.ttt_board[8]} "
	end

	def get_move
		puts active_player.get_move(board.ttt_board)
	end

	def update_position
		move = get_move
		marker = active_player.marker
		board.update_position(move, marker)
	end

	def change_player
		if active_player == p2
			active_player = p1
		else
			active_player = p2
		end
		puts active_player
	end

	def check_winner
		if board.winner?(board)
			puts true
		else
			puts false
		end
	end

	def check_tie
		if board.full_board?(board)
			puts 'Tied!'
		else
			puts 'Keep playing!'
		end
	end
end