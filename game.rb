require 'json'

class Game
 
  
  @@dic = []
  $guess_array = []
  $random_word_array = []
  
  File.open("5desk.txt").each { |line| @@dic.push(line) if line.length > 5 && line.length <14}
  @word = " "
  @gameWon = false
  def initialize 
    puts "This ran!"
    @word = @@dic[rand(0..48891)] 
    gameLoop
  end
  
  def gameLoop
    while !@gameWon
      getGuess
      displayRandomWord
    end
  end
  
  def getGuess
    oneLetter = false
    while !oneLetter
      puts "Enter a single letter as your choice: "
      guess = gets.chomp
      puts guess.length
      oneLetter = true if guess.length == 1
    end
    
    $guess_array.push(guess)
  end
  
  def checkGuess
    $random_word_array.each do |letter|
      
    end
  end
  
  def displayRandomWord
    
    $random_word_array = @word.split('')
    $random_word_array.delete_at($random_word_array.length-1)
    print $random_word_array
    puts
    print $guess_array
    puts $random_word_array =~ /$guess_array[0]/
    $random_word_array.each do |letter|
      puts letter
    end
  end
  
  def getWord
    @word
  end
  
end