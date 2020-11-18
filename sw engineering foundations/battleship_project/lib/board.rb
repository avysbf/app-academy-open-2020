class Board

    attr_reader :size

    def self.print_grid(arr)
        arr.each do |sbary|
            puts sbary.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](coord)
        return @grid[coord[0]][coord[1]]
    end

    def []=(coord, val)
        @grid[coord[0]][coord[1]] = val
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)

        if self[pos] == :S
            self[pos] = :H
            puts "You sunk my battleship!"
            true
        else
            self[pos] = :X
            false
        end
    end

    def place_random_ships
        amnt = @size * 0.25
        while self.num_ships < amnt
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            pos = [row, col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |sbary|
            sbary.map do |ele|
                if ele == :S
                    ele =:N
                else
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
