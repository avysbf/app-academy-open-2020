require_relative "code"

class Mastermind

    def initialize(len)
        @secret_code = Code.random(len)
    end

    def print_matches(guess)
        puts "Exact matches: #{@secret_code.num_exact_matches(guess)}"
        puts "Near matches: #{@secret_code.num_near_matches(guess)}"
    end

    def ask_user_for_guess
        puts "Enter a code:"
        userguess = Code.from_string(gets.chomp)
        print_matches(userguess)
        userguess == @secret_code
    end
end
