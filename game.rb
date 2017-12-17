require 'json'

class Game
 
  
  @@dic = []
  @guess_array = []
  File.open("5desk.txt").each { |line| @@dic.push(line) if line.length > 5 && line.length <14}
  @word = " "
  
  def initialize 
    puts "This ran!"
    @word = @@dic[rand(0..48891)] 
    
  end
  
  def getGuess
    oneLetter = false
    while !oneLetter
      puts "Enter a single letter as your choice: "
      guess = gets.chomp
      puts guess.length
      oneLetter = true if guess.length == 1
    end
    
    @guess_array.push(guess)
  end
  
  def getWord
    @word
  end
  
end