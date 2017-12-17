require_relative "game.rb"

puts "Welcome to Hangman"


quit = false
count = 12
while quit == false
  
  puts "Enter 1 for new game, 2 to load a game and 3 for quit: "
  choice = gets.chomp
  
  case choice
  when "1"
    game = Game.new
    while !quit
      puts "You have #{count} guesses left!"
      quit = game.getGuess
      game.displayRandomWord
      
      count -= 1
      
    end
    quit = true if count == 0
  when "2"
    #Open a saved file here
  when "3"
    quit = true
  end
  
  
end