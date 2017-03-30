require 'minitest/autorun'
require_relative '../random.rb'

class Test_Random_AI < Minitest::Test

	def test_create_player
		player = Random.new('X')
		assert_equal('X', player.marker)
	end

	def test_open_spot
		player = Random.new('O')
		assert_equal(0, player.get_move(['', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O']))
	end

	def test_open_spot_0_1_2
		player = Random.new('O')
		assert_equal(true, [0,1,2].include?(player.get_move(['', '', '', 'X', 'O', 'X', 'O', 'X', 'O'])))
	end

	def test_random_position
		player = Random.new('O')
		assert_equal(true, [0,1,2,3,4,5,6,7,8].include?(player.get_move(['', '', '', '', '', '', '', '', ''])))
	end
end