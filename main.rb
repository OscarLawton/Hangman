require_relative "game.rb"

puts "Welcome to Hangman"


quit = false
quitGame = false
while quit == false
  
  puts "Enter 1 for new game, 2 to load a game and 3 for quit: "
  choice = gets.chomp
  
  case choice
  when "1"
    game = Game.new
    while !quitGame
     
      quitGame = game.gameLoop
    
    end
    
  when "2"
    #load a saved file 
  when "3"
    quit = true
    
  end
  quitGame = false
  
end