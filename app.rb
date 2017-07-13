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
		session[:human] = nil
		session[:board] = Board.new('spaces', 'board_side', 'length_of_single_side')
		# board = session[:board]
		session[:opponent] = params[:opponent]


		session[:player_1] = Human.new('X')
		session[:active_player] = session[:player_1]

			if session[:opponent] == 'Human'
				session[:opponent] = Human.new('O')
				session[:human] = 'human'
				redirect '/board_size'

			elsif session[:opponent] == 'Sequential'
				session[:opponent] = Sequential.new('O')
				redirect '/board_size'

			elsif session[:opponent] == 'Random'
				session[:opponent] = RandomAI.new('O')
				redirect '/board_size'

			else session[:opponent] == 'Unbeatable'
				session[:opponent] = Unbeatable.new('O')
				redirect '/board_size'

			end
	end

	get '/board_size' do
		erb :board_size, :locals => {:spaces => session[:spaces], :board_side => session[:board_side], :length_of_single_side => session[:length_of_single_side]}
	end

	post '/board_size' do
		"Hello World"
	end

	get '/board' do
		erb :game_board, :locals => {:board => session[:board], :opponent => session[:opponent], :player_1 => session[:player_1], :active_player => session[:active_player].marker}
		# "#{session[:opponent].class}"
		# "#{session[:board].ttt_board}"
	end

	get '/get_move' do
		move = session[:active_player].get_move(session[:board].ttt_board)
		session[:board].update_position(move, session[:active_player].marker)
		# session[:board].update_position(move, 'O')

		redirect '/check_for_win_or_tie'
		# "#{session[:active_player].marker}"
	end

	post '/user_choice' do
		# params['square spot'] has to be removed and replaced (REQUIRED FOR GAME TO CONTINUE PAST FIRST MOVE)
		# Put ability to choose board size in separate view and re-connect pages accordingly.
		choice = params['square_spot'].to_i
		session[:board].update_position(choice, session[:active_player].marker)
		redirect '/check_for_win_or_tie'
	end

	get '/check_for_win_or_tie' do
		if session[:board].winner_3_by_3?(session[:active_player].marker)
			redirect '/win'
		elsif session[:board].full_board?(:ttt_board)
			redirect '/tie_game'
		else
			redirect '/change_player'
		end
	end

	get '/change_player' do
		if session[:active_player] == session[:player_1]
			session[:active_player] = session[:opponent]
		else
			session[:active_player] = session[:player_1]
		end
		
		if session[:active_player] == session[:player_1] || (session[:active_player] == session[:opponent] && session[:human] == 'human')
			redirect '/board'
		else
			redirect '/get_move'
		end
	end

	get '/win' do
		erb :win, locals: {board: session[:board], active_player: session[:active_player].marker}
		# "#{session[:board].ttt_board}"
	end

	get '/tie_game' do
		erb :tie_game, locals: {board: session[:board], active_player: session[:active_player].marker}
	end		

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
