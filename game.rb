=begin
    task breakdown
    1 - create a function to generate a random code containing 4 of the 6 colors
    2 - accept the guess from the player
    3 - check if the guess is valid 
      a - is four digits only
      b - contains only the digits in the range of colors
    4 - evaluate accuracy of guess
    5 - display feedback 
      a - * = red = correct color, correct pos
      b - ^ = white = correct color
      c - - = neither color, nor pos
    6 - repeat 2-5 until player wins or number of attempts is exhausted
=end

COLORS = { 0=>'red', 1=>'yellow', 2=>'green', 3=>'blue', 4=>'orange', 5=>'black'}
MAX_TRY = 10

class Mastermind 
    attr_accessor :code

    # def initialize()
    #     @code = []
    #     4.times do
    #         @code.append((rand()*5.9).to_i)
    #     end
    # end

    def valid_guess?(g)
        if contains_valid_color?(g) and correct_length?(g)
            print evaluate_guess(g)
            return true
        else 
            return false
        end
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

    def evaluate_guess(g)
        feeback = []
        sample = g
        index = 4
        while (sample > 0)
            digit = sample%10
            if @code.any?(digit)
                if index == @code.index(digit)
                    feeback.append("*")
                else
                    feeback.append(1)
                end
            end
            sample /= 10
            index -= 1
        end
        return feeback.shuffle.to_s
    end
end

board = Mastermind.new


board.code = [5,3,3,1]
p board.code
g = 3132
until board.valid_guess?(g) do
    puts "input your guess"
    g = gets.chomp.to_i
end

puts board.evaluate_guess(g)