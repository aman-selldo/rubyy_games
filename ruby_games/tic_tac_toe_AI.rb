class Tic_tac_toe
    def initialize
        @board = Array.new(9, " ")
        @current_player = 'X'
    end

    def play
        puts "Welcome to Tic Tac Toe Game!"
        until game_over?
            display_board
            if @current_player == "X"
                player_move
            else
                computer_move
            end
            switch_player  
        end
        display_board
        if winner
            puts "Congratulations! #{winner} won the game"
        else
            puts "Tum se nah ho payega"
        end
    end

    def switch_player
        @current_player = @current_player == "X" ? "O" : "X"
    end


    def game_over?
        winner || @board.none? {|space| space == " "}
    end

    def winner
        winning_combinations.each do |combo|
            if combo.all? {|indx| @board[indx] == "X"}
                return "X"
            elsif combo.all? {|indx| @board[indx] == "O"}
                return "O"
            end
        end
        nil
    end

    def winning_combinations
        [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], 
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]
        ]
    end

    def display_board
        puts " 
        #{@board[0]} | #{@board[1]} | #{@board[2]}
        ---+---+---
        #{@board[3]} | #{@board[4]} | #{@board[5]}
        ---+---+---
        #{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

    def player_move
        puts "Player X, enter your move (1-9): "
        move = gets.chomp.to_i - 1
        if valid_move?(move)
            @board[move] = "X"
        else
            puts "Invalid move ! Please try again"
            player_move
        end 
    end

    def computer_move
        puts "Computer is thinking"
        best_score = -999999
        best_move = nil
        @board.each_with_index do |cell, index|
            if cell == " "
                @board[index] = "O"
                score = minimax(false)
                @board[index] = " "
                if score > best_score
                    best_score = score
                    best_move = index
                end
            end
        end
        @board[best_move] = "O"
        puts "Computer chooses the position #{best_move + 1}"
    end



    def valid_move?(move)
        move.between?(0, 8) && @board[move] == " "
    end

    def minimax(is_maximizing)
        if winner == "O"
            return 1
        elsif winner == "X"
            return -1 
        elsif @board.none? {|space| space == " "}
            return 0
        end

        if is_maximizing
            best_score = -999999
            @board.each_with_index do |cell, index|
                if cell == " "
                @board[index] = "O"
                score = minimax(false)
                @board[index] = " "
                best_score = [best_score, score].max
                end
            end
            return best_score
        else
            best_score = 999999
            @board.each_with_index do |cell, index|
                if cell == " "
                    @board[index] = "X"
                    score = minimax(true)
                    @board[index] = " "
                    best_score = [best_score, score].min
                end
            end
            return best_score
        end
    end

end
Tic_tac_toe.new.play