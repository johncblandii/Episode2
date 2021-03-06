require_relative "fighter"
require_relative "turn"
class Match
	
	attr_reader :turns
	def initialize(opponent_a, opponent_b)
		@opponent_a = opponent_a #user
		@opponent_b = opponent_b #computer
		@turns = []
	end
	
	def opponents
		[@opponent_a, @opponent_b]
	end

	def winner
		if winner_count_for_opponent(@opponent_a) > winner_count_for_opponent(@opponent_b)
			@opponent_a
		else
			@opponent_b
		end
	end

	def winner_count_for_opponent(opponent)
		@turns.select{ |turn| opponent == turn.winner}.count
	end

	def take_turn(move)
		@opponent_a.move = move
		@opponent_b.move = @opponent_b.random_move #force a random move
		turn = Turn.new(@opponent_a, @opponent_b)
		@turns << turn
		turn
	end

end