require_relative 'console_game.rb'

# def chose_player_1
# 	puts 'Choose Player 1'

# game=Console_Game.new(Random.new('X'), Human.new('O'))
# game=Console_Game.new(Random.new('X'), Random.new('O'))
game=Console_Game.new(Human.new('X'), Human.new('O'))

game.intro_ttt

until game.check_winner || game.check_tie
	game.change_player
	game.create_board
	game.get_move
	game.update_position
end

game.create_board

if game.check_winner
	puts "#{game.active_player.marker} Wins!"
else
	puts 'Tie game!'
end