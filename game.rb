require "./players"
require "./question"

class Game
  def initialize
    @game_over = false
    @players = []
    @players << Player.new(1)
    @players << Player.new(2)
    @turn = 0
  end

  def start
    while !@game_over do
      currentPlayer = @players[@turn % 2]
      otherPlayer = @players[(@turn + 1) % 2]
      currentQuestion = Question.new(currentPlayer.name)
      currentQuestion.ask
      answer = gets.chomp.to_i
      if currentQuestion.confirm(answer)
        puts "YES! You are correct."
      else 
        puts "Seriously? No!"
        currentPlayer.minusScore
        if currentPlayer.score == 0
          puts "#{otherPlayer.name} wins with a score of #{otherPlayer.score}/3"
          puts "----- GAME OVER -----"
          puts "Good bye!"
          break
        end
      end
      puts "P1: #{@players[0].score}/3 vs P2: #{@players[1].score}/3"
      puts "----- NEW TURN -----"
      @turn = @turn + 1
    end
  end
end