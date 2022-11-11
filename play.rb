class Hangman
  def initialize
    @letters = ("a".."z").to_a
    @word = words.sample
    @lives = 7
    @correct = []
    @word_length = ""
    @word.first.size.times do
      @word_length += " _ "
      end
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

  def tester(last_guess = nil)
    update(last_guess) unless last_guess.nil?
    puts @word_length
  end

  def update(last_guess)
    new_test = @word_length.split
    new_test.each_with_index do |letter, index|
      
      if letter = "_" && @word.first[index] == last_guess
        new_test[index] = last_guess
    
  end
end
@word_length = new_test.join(" ")
end

  def guess_word 
   if @lives > 0
    puts "Enter a letter"
    guess = gets.chomp 
    game_guess = @word.first.include? guess
    if game_guess 
      puts "You find a letter"
      @correct.push(guess)
      @letters.delete guess
      tester guess
    else 
      @lives -= 1
      puts "You missed it. You have #{ @lives } guesses left"
      guess_word
    end
  else 
    puts "Game over! Start again."
  end
end

  def begin
    puts "Welcome to the game... Your clue is #{@word.first.size} characters long"
    tester

    puts "Clue : "" #{ @word.last }"
   guess_word
end

end 

game = Hangman.new
game.begin