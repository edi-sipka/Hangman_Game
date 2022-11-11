=begin class Hangman

  def initialize
    @word = words.sample
    @lives = 7
    @word_teaser = ""
    @word.first.size.times do
      @word_teaser += "_ "
      end
  end

  def words
  [
   ["basketball", "A game played by tall guys"],
   ["wedding", "Celebration of loved..."],
   ["sunday", "Day in a week"],
   ["scorpion", "Zodiac sign"],
   ["action", "Type of movie"]
  ]
  end

  def tester(last_guess = nil)
    update(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update(last_guess)
    new_test = @word_teaser.split
    new_test.each_with_index do |letter, index|
      
      if letter == '_' && @word.first[index] == last_guess
        new_test[index] = last_guess
  end
end

@word_teaser = new_test.join(' ')
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

      if @word.first == @word_teaser.split.join
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
    puts "Welcome to the game... Your clue is #{ @word.first.size } characters long"
    puts "To exit game type `exit`"
    tester

    puts "Clue : "" #{ @word.last }"

   guess_word
end

end 

game = Hangman.new
game.begin

=end 

class Hangman

  def initialize
    @word = words.sample
    @lives = 7
    @word_teaser = ""

    @word.first.size.times do
      @word_teaser += "_ "
    end
  end

  def words
    [
     ["basketball", "A game played by tall guys"],
     ["wedding", "Celebration of loved..."],
     ["sunday", "Day in a week"],
     ["scorpion", "Zodiac sign"],
     ["action", "Type of movie"]
    ]
    end

  def print_teaser last_guess = nil
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser last_guess
    new_teaser = @word_teaser.split

    new_teaser.each_with_index do |letter, index|
      if letter == '_' && @word.first[index] == last_guess
        new_teaser[index] = last_guess
      end
    end

    @word_teaser = new_teaser.join(' ')
  end

  def make_guess
    if @lives > 0
      puts "Enter a letter"
      guess = gets.chomp

      good_guess = @word.first.include? guess

      if guess == "exit"
        puts "Thank you for playing!"
        
      #if guess is longer than 1 letter
      elsif guess.length > 1
        puts "Only one letter please"
          make_guess
        
      elsif good_guess
        puts "You are right!"

        print_teaser guess

        if @word.first == @word_teaser.split.join
          puts "Congratulations... you have won this round!"
        else
          make_guess
        end
      else
        @lives -= 1
        puts "You have #{ @lives } lives left. Try again!"
        make_guess
      end
    else
      puts "Game over..."
    end
  end

  def begin
    # ask user for a letter
    puts "New game started... your word is #{ @word.first.size } characters long"
    puts "To exit game at any point type 'exit'"
    print_teaser

    puts "Clue: #{ @word.last }"

    make_guess
  end

end

start = Hangman.new
start.begin