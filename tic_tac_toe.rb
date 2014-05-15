class Board < Hash
	def initialize
		@board = {
			a1: " ", a2: " ", a3: " ",
			b1: " ", b2: " ", b3: " ",
			c1: " ", c2: " ", c3: " "
		}
	end

	def draw
		puts "   1 2 3"
		puts "a  #{@board[:a1]}|#{@board[:a2]}|#{@board[:a3]}"
		puts "   - - -"
		puts "b  #{@board[:b1]}|#{@board[:b2]}|#{@board[:b3]}"
		puts "   - - -"
		puts "c  #{@board[:c1]}|#{@board[:c2]}|#{@board[:c3]}"
	end

	def update_board(cell, symbol)
		@board[cell] = symbol
	end

	def valid_move?(cell)
		if @board.has_key?(cell) && @board[cell] == " "
			true
		else
			false
		end
	end

	def check_win
		if (@board[:a1] == @board[:a2] && @board[:a2] == @board[:a3] && @board[:a1] != " ") ||
			(@board[:b1] == @board[:b2] && @board[:b2] == @board[:b3] && @board[:b1] != " ") ||
			(@board[:c1] == @board[:c2] && @board[:c2] == @board[:c3] && @board[:c1] != " ") ||
			(@board[:a1] == @board[:b1] && @board[:b1] == @board[:c1] && @board[:a1] != " ") ||
			(@board[:a2] == @board[:b2] && @board[:b2] == @board[:c2] && @board[:a2] != " ") ||
			(@board[:a3] == @board[:b3] && @board[:b3] == @board[:c3] && @board[:a3] != " ") ||
			(@board[:a1] == @board[:b2] && @board[:b2] == @board[:c3] && @board[:a1] != " ") ||
			(@board[:a3] == @board[:b2] && @board[:b2] == @board[:c1] && @board[:a3] != " ")
			true
		else
			false
		end
	end

	def board_full? 
		if @board[:a1] != " " && @board[:a2] != " " && @board[:a3] != " " &&
			@board[:b1] != " " && @board[:b2] != " " && @board[:b3] != " " &&
			@board[:c1] != " " && @board[:c2] != " " && @board[:c3] != " "
			true
		else
			false
		end
	end

end

class Player
	def initialize(symbol)
		@symbol = symbol
	end

	def get_symbol
		@symbol
	end
end

class Game
	def initialize
		@game = Board.new
		@playerX = Player.new("X")
		@playerO = Player.new("O")
		puts "Welcome to the game of Tic Tac Toe!"
	end

	def play
		@currentplayer = [@playerX, @playerO].sample
		@game.draw
		while !@game.board_full?
			get_move
			@game.draw
			if win?
				winner
				break
			elsif @game.board_full?
				puts "It's a tie!"
				break
			end
			changePlayer
		end
	end

	def win?
		@game.check_win 
	end

	def winner
		puts "Player #{@currentplayer.get_symbol} wins!"
	end

	def get_move
		puts "Player #{@currentplayer.get_symbol} move"
		puts "Please select empty cell for your next move (e.g. a1, c3):"
		@cell = gets.chomp.to_sym
		while !@game.valid_move?(@cell)
			puts "This move is not valid. Cell already taken or out of range!"
			puts "Please try again (e.g. a1, c3):"
			@cell = gets.chomp.to_sym
		end
		@game.update_board(@cell, @currentplayer.get_symbol)
	end

	def changePlayer
		if @currentplayer == @playerX
			@currentplayer = @playerO
		else
			@currentplayer = @playerX
		end
	end

end

new_game = Game.new
new_game.play