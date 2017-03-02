require_relative 'console_game.rb'

game=Console_Game.new(Random.new('X'), Random.new('O'))

game.intro_ttt

game.get_move

game.update_position

game.create_board

game.change_player

game.get_move

game.update_position

game.create_board 

until game.check_winner || game.check_tie

	game.change_player
	game.get_move
	game.update_position
	game.create_board
end

game.check_winner

game.check_tie