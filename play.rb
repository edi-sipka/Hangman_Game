class Hangman
  def initalize
    @letters = ("a".."z").to_a
    @word = words.sample
  end

  def words
  [
   ["cricket", "A game played by gentlemen"],
   ["jogging", "We are walking..."],
   ["celebrate", "Remembering special moments"],
   ["continent", "There are 7 of these"],
   ["exotic", "Not from around here..."]
  ]
  end

  def begin
    #start game
    puts "Welcome to the game... Your clue is #{@word.first}"
    guess = gets.chomp 
    puts "You guessed #{guess}"
end

end 

game = Hangman.new
game.begin