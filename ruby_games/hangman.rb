class Hangman
    def initialize
        @word = "lion"
        @guesses = []
        @attempts = 6
    end

    def play
        puts "Welcome to the Hangman game !"

        until game_over?
            display_word
            puts "Lives left : #{@attempts}"
            puts "Enter a letter"
            letter = gets.chomp.downcase
            
            if vaild_guess?(letter)
                process_guess(letter)
            else
                if letter.match?(/^\d$/)
                    puts "Invaild input ! Please enter an alphabetic letter, not a numeric value"
                else
                    puts "Invaild Guess ! Please enter a single letter you haven't guessed before"
                end
            end
        end
        
        if won?
            puts "Congratulations! You have guessed the word : #{@word}"
        else
            puts "Game Over ! The word was: #{@word}"
        end

    end

    def display_word  
        masked_word = @word.chars.map {|char| @guesses.include?(char) ? char : "_"}.join(" ")
        puts masked_word
    end

    def vaild_guess?(letter)
        letter.match?(/^[a-z]$/) && !@guesses.include?(letter)
    end

    def process_guess(letter)
        @guesses << letter
        if @word.include?(letter)
            puts "Good guess !"
        else
            puts "Wrong guess !"
            @attempts -= 1
        end
    end

    def game_over?
        won? || @attempts.zero?
    end

    def won? 
        @word.chars.all? {|char| @guesses.include?(char)}
    end
end

Hangman.new.play