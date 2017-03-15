require 'sinatra'

require_relative 'board.rb'
require_relative 'unbeatable.rb'
require_relative 'Play_Console_Game.rb'

enable :sessions

class TicTacToe < Sinatra::Base

	get '/' do
		
		erb :welcome
	
	end

	post '/get_opponent' do
		session[:opponent] = params[:opponent]
		board = Board.new

		erb :get_opponent, :locals => {opponent: session[:opponent], board: board}
	end
end