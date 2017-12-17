require 'json'

class Game
 
 
  @@dic = []
   
  
  File.open("5desk.txt").each { |line| @@dic.push(line) if line.length > 5 && line.length <14}
  @word = " "
  
  
  def initialize
    
    @gameWon = false
    @guessCount = 12
    @bad_guess_array= []
    @random_word_array = @@dic[rand(0..48891)].downcase.split('')
    @random_word_array.delete_at(@random_word_array.length-1)
    
  end
  
  def gameLoop
    
    
    puts "You have #{@guessCount} guesses left!"
    
    while @guessCount > 0 && !@gameWon
      quit = getGuess
      puts "Will this run"
      
      displayRandomWord
      @guessCount -= 1
    end
    quit
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
      
      
      @bad_guess_array.include?(guess) ? alreadyGuessed = true : @bad_guess_array.push(guess)
      puts "You already guessed that letter, guess again." if alreadyGuessed
      
      oneLetter = true if guess.length == 1
      puts "One charater at a time, guess again." if oneLetter == false
      
      (guess.ord > 64 && guess.ord < 91 ) || (guess.ord > 96 && guess.ord < 123) || guess.ord == 49 ? goodChars = true : goodChars = false
      puts "Only letters please, guess again." if goodChars == false
   
    puts "This ran from getGuess"
      
    end
    puts "Will this run from getguess"
    true if guess == "1"
  end
  
  def checkIfWon
    
  end
  
  def displayRandomWord
    puts "This ran from displayRandomWord"
    print @random_word_array
    puts
    
    @random_word_array.each do |letter|
      
      print @bad_guess_array.include?(letter) ? letter : "_"
      
    end
   
  end
  
  def getWord
    @word
  end
  
end