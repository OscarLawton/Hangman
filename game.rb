require 'json'

class Game
 
 
  @@dic = []
   
  
  File.open("5desk.txt").each { |line| @@dic.push(line) if line.length > 5 && line.length <14}
  @word = " "
  
  
  def initialize
    
    @gameWon = false
    @guessCount = 12
    @good_guess_array= []
    @bad_guess_array = []
    @random_word_array = @@dic[rand(0..48891)].downcase.split('')
    @random_word_array.delete_at(@random_word_array.length-1)
    
  end
  
  def gameLoop
    
    while @guessCount > 0 
      puts "You have #{@guessCount} guesses left!"
      quit = getGuess
      displayRandomWord 
      
      @guessCount -= 1
      return quit
    end
    puts "You ran out of guesses" if @guessCount <= 0
      
  end
  
  def getGuess
    
    oneLetter = false
    alreadyGuessed = false
    goodChars = false
    
    while !oneLetter && !alreadyGuessed && !goodChars
      puts 
      print @random_word_array
      puts
      print "Guesses you already tried"
      print @bad_guess_array
      puts
      puts "Enter a single letter as your choice: "
      guess = gets.chomp.downcase
      
      
      
      puts "You already guessed that letter, guess again." if @bad_guess_array.include?(guess)
      
      oneLetter = true if guess.length == 1
      puts "One charater at a time, guess again." if oneLetter == false
      
      (guess.ord > 64 && guess.ord < 91 ) || (guess.ord > 96 && guess.ord < 123) || (guess.ord == 49 || guess.ord == 48) ? goodChars = true : goodChars = false
      puts "Only letters please, guess again." if goodChars == false
       
      checkMethod(guess)
    end
    puts "This ran"
    to_json if guess == "0"
    true if guess == "1"
  end
  
  def checkMethod guess
    
   @random_word_array.include?(guess) ? @good_guess_array.push(guess) : (@bad_guess_array.push(guess) if guess != "0")
    
  end
  
  def gameWonCheck
    print @good_guess_array
    print @random_word_array
    if @good_guess_array == @random_word_array
      puts "YOU WON!!!"
      @gameWon = true
      return true
    end
  end
  
  def displayRandomWord
    blankCounter = 0
    letterCounter = 0
    @random_word_array.each do |letter|
      if  @good_guess_array.include?(letter)
        print letter
      else
        print "_"
        blankCounter += 1
      end
      letterCounter += 1
    
    end
    puts "letterCounter is equal to: #{letterCounter}"
    puts "RWA is equall to: #{@random_word_array.length}"
    if letterCounter == @random_word_array.length && blankCounter == 0
      puts "You Won!!!"
      @gameWon = true
      return true
    end
    return false
  end
  
  def to_json
    puts "Game Saved!!!"
    JSON.dump ({
      :gameWon => @gameWon,
      :guessCount => @guessCount,
      :good_guess_array => @good_guess_array,
      :bad_guess_array => @bad_guess_array,
      :@random_word_array => @random_word_array
    })
  end
 
  
end