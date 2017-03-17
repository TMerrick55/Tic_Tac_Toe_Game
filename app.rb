require 'sinatra'

require_relative 'board.rb'
require_relative 'sequential.rb'
require_relative 'random.rb'
require_relative 'unbeatable.rb'

enable :sessions

class TicTacToe < Sinatra::Base

	get '/' do
		erb :welcome
	end

	post '/get_opponent' do
		session[:opponent] = params[:opponent]
		board = Board.new

		erb :get_opponent, :locals => {opponent: session[:session], board: board}
	end
end