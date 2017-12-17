require_relative "game.rb"

puts "Welcome to Hangman"


quit = false
while quit == false
  
  puts "Enter 1 for new game, 2 to load a game and 3 for quit: "
  choice = gets.chomp
 
  case choice
  when "1"
   
    
    
    game = Game.new
   
  
  when "2"
    #Open a saved file here
  when "3"
    quit = true
  end
  
  
end