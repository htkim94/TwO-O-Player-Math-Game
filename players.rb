class Player
  attr_accessor :name, :score

  def initialize(num)
    @name = "Player #{num}"
    @score = 3
  end

  def minusScore
    @score = @score - 1
  end
end