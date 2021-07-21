class Question
  attr_accessor :question

  def initialize(player_name)
    @player = player_name
    num1 = rand(1..20)
    num2 = rand(1..20)
    @question = "What does #{num1} plus #{num2} equal?"
    @answer = num1 + num2
  end

  def ask
    puts "#{@player}: #{@question}"
  end

  def confirm(num)
    @answer === num
  end
end