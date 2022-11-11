class Hangman

  def initialize
    @word = words.sample
    @lives = 7
    @word_length = ""
    @word.first.size.times do
      @word_length += "_ "
      end
  end

  def words
  [
   ["basketball", "A game played by tall guys"],
   ["wedding", "Celebration of loved..."],
   ["sunday", "Day in a week"],
   ["scorpion", "Zodiac sign"],
   ["Action", "Type of movie"]
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

    if guess == "exit"
      puts "Thank you for playing"

    elsif guess.length > 1
      puts "only guess 1 letter at a time please!"
      guess_word
    
    elsif game_guess
      puts "You are correct"
      tester guess

      if @word.first == @word_length.split.join
        puts "You have won this game!"
      else
      game_guess
      end
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
    puts "To exit game type `exit`"
    tester

    puts "Clue : "" #{ @word.last }"

   guess_word
end

end 

game = Hangman.new
game.begin