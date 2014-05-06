class Board < Hash
	def initialize
		@board = {
			"a1" => " ", "a2" => " ", "a3" => " ",
			"b1" => " ", "b2" => " ", "b3" => " ",
			"c1" => " ", "c2" => " ", "c3" => " "
		}
	end

	def draw
		puts "   1 2 3"
		puts "a  #{@board['a1']}|#{@board['a2']}|#{@board['a3']}"
		puts "   - - -"
		puts "b  #{@board['b1']}|#{@board['b2']}|#{@board['b3']}"
		puts "   - - -"
		puts "c  #{@board['c1']}|#{@board['c2']}|#{@board['c3']}"
	end
end

class Player
	def initialize(symbol)
		@symbol = symbol
	end
end

class Game
	def initialize
		@game = Board.new
		@playerX = Player.new("X")
		@playerO = Player.new("O")
		@game.draw
	end

	def play
	end

	def win?
	end

	def prompt
		puts "Please select empty cell for your next move (e.g. a1, c3):"
		@move = gets.chomp
		puts @move.inspect
	end

	def valid_move?
		if @game.has_key?(@move)# && @game[@move] == " "
			true
		else
			puts "This move is not valid. Please try again!"
			puts @move.inspect
		end
	end

	def changePlayer
		if currentplayer == @playerX
			currentplayer = @playerO
		else
			currentplayer = @playerX
		end
	end

	def winning_conditions
		@conditions = [
			[:a1, :a2, :a3],
			[:b1, :b2, :b3],
			[:c1, :c2, :c3],
			[:a1, :b1, :c1],
			[:a2, :b2, :c2],
			[:a3, :b3, :c3],
			[:a1, :b2, :c3],
			[:a3, :b2, :c1]
		]
	end

end

b = Game.new
b.prompt
b.valid_move?