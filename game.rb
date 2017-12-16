require 'json'

class Game
 
  @word = " "
  def initialize randomWord
    
    @word = randomWord
  
  end
  
  def getName
    @word
  end
  
end