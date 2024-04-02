=begin
    task breakdown
    1 - create a function to generate a random code containing 4 of the 6 colors
    2 - accept the guess from the player
    3 - check if the guess is valid 
      a - is four digits only
      b - contains only the digits in the range of colors
    4 - evaluate accuracy of guess
    5 - display feedback
    6 - repeat 2-5 until player wins or number of attempts is exhausted
=end

COLORS = { 0=>'red', 1=>'yellow', 2=>'green', 3=>'blue', 4=>'orange', 5=>'black'}

class Mastermind 
    attr_reader :code

    def initialize()
        @code = []
        4.times do
            @code.append((rand()*5.9).to_i)
        end
    end

    def valid_guess?(g)
        contains_valid_color?(g) and correct_length?(g)
    end

    def contains_valid_color?(g)
        sample = g
        flag = true
        while(sample>0) do
            digit = sample %10
            if ((digit >5) and (digit<=9))
                flag = false
            end
            sample /=10
        end
        return flag
    end

    def correct_length?(g)
        g.to_s.size == 4
    end
end

board = Mastermind.new

p board.code
g = 9999
until board.valid_guess?(g) do
    puts "input your guess"
    g = gets.chomp.to_i
end