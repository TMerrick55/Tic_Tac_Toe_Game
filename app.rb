require 'sinatra'

require_relative 'board.rb'
require_relative 'sequential.rb'
require_relative 'random.rb'
require_relative 'unbeatable.rb'
require_relative 'human.rb'

enable :sessions

# class TicTacToe < Sinatra::Base

	get '/' do
		erb :welcome
	end

	post '/get_opponent' do
		session[:board] = Board.new
		# board = session[:board]
		opponent = params[:opponent]

			if opponent == 'Human'
				session[:opponent] = Human.new('O')
				redirect '/board'

			# elsif opponent == 'Sequential'
			# 	session[:opp] = Sequential.new('O')

			# elsif opponent == 'Random'
			# 	session[:opp] = Random.new('O')

			# else opponent == 'Unbeatable'
			# 	session[:opp] = Unbeatable.new('O')
			end
	end

	get '/board' do
		erb :game_board, :locals => {:board => session[:board], :opponent => session[:opponent]}
	end

	# MIGHT ADD TTT_BOARD TO 'SESSION[:BOARD]' TO ABOVE ERB

	post '/user_choice' do

		choice = params['square_spot'].to_i
		marker = 'X'
		session[:board].ttt_board[choice] = 'X'
		# session[:board].update_position(choice, marker)
		# redirect '/board'

		# CHANGE AS NEEDED BASED ON SHIRLEY'S '/move'

		"#{session[:board].ttt_board} here"


	# pos0 = "#{board.ttt_board[0]}"
	# pos1 = "#{board.ttt_board[1]}"
	# pos2 = "#{board.ttt_board[2]}"
	# pos3 = "#{board.ttt_board[3]}"
	# pos4 = "#{board.ttt_board[4]}"
	# pos5 = "#{board.ttt_board[5]}"
	# pos6 = "#{board.ttt_board[6]}"
	# pos7 = "#{board.ttt_board[7]}"
	# pos8 = "#{board.ttt_board[8]}"

	# "Opponent is #{opponent}"

		# erb :board, :locals => {:opponent => session[:opponent], :board => board, :pos0 => pos0, :pos1 => pos1, :pos2 => pos2, :pos3 => pos3, :pos4 => pos4, :pos5 => pos5, :pos6 => pos6, :pos7 => pos7, :pos8 => pos8}

end

# post '/board' do

# 	backend_p1 = params[:p1]
# 	backend_p2 = params[:p2]
# 	position0 = params[:pos0]
# 	position1 = params[:pos1]
# 	position2 = params[:pos2]
# 	position3 = params[:pos3]
# 	position4 = params[:pos4]
# 	position5 = params[:pos5]
# 	position6 = params[:pos6]
# 	position7 = params[:pos7]
# 	position8 = params[:pos8]
# end
# end