require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts "Amount of ships: #{@board.size * 0.25}"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "You lose"
            true
        else
            false
        end
    end

    def win?
        if @board.num_ships == 0
            puts "You win"
            true
        else
            false
        end
    end

    def game_over?
        if self.win? || self.lose?
            true
        else
            false
        end
    end

    def turn
        pos = @player.get_move
        if @board.attack(pos) == false
            @remaining_misses -= 1
        end
        @board.print
        puts "Remaining misses: #{@remaining_misses}"
    end
end
