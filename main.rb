require_relative "game.rb"

puts "Welcome to Hangman"

dic = []
File.open("5desk.txt").each { |line| dic.push(line) if line.length > 5 && line.length <14}
quit = false
newGame = false
while quit == false
  
  puts "Enter 1 for new game, 2 for load a saved game, 3 to load a game and 4 for quit: "
  choice = gets.chomp
 
  case choice
  when "1"
   
    randWord = dic[rand(0..48891)]
    
    game = Game.new(randWord)
    
    newGame = true
  when "2"
    #Open a saved file here
  when "2"
    
  when "4"
    quit = true
  end
  
  
end