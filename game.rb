require 'json'

class Game
 
 
  @@dic = []
  $guess_array = []
  $random_word_array = []
 
  
  File.open("5desk.txt").each { |line| @@dic.push(line) if line.length > 5 && line.length <14}
  @word = " "
  @gameWon = false
  
  def initialize
   
    $random_word_array = @@dic[rand(0..48891)].downcase.split('')
    $random_word_array.delete_at($random_word_array.length-1)
   
    
  end
  

  
  def getGuess
    
    oneLetter = false
    alreadyGuessed = false
    goodChars = false
    
    while !oneLetter && !alreadyGuessed && !goodChars
      print "Your guesses are :"
      print $guess_array
      puts "Enter a single letter as your choice: "
      guess = gets.chomp
      guess.downcase
      puts guess.length
      
      $guess_array.include?(guess) ? alreadyGuessed = true : $guess_array.push(guess)
      puts "You already guessed that letter, guess again." if alreadyGuessed
      
      oneLetter = true if guess.length == 1
      puts "One charater at a time, guess again." if oneLetter == false
      
      (guess.ord > 64 && guess.ord < 91 ) || (guess.ord > 96 && guess.ord < 123) || guess.ord == 49 ? goodChars = true : goodChars = false
      puts "Only letters please, guess again." if goodChars == false
   
    end
      true if guess == "1"
  end
  
  
  
  def displayRandomWord
    
  
    
    print $random_word_array
    puts
    
  
    $random_word_array.each do |letter|
      
      print $guess_array.include?(letter) ? letter : "_"
     
      
       
    end
   
  end
  
  def getWord
    @word
  end
  
end