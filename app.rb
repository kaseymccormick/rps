#gathering Player class from player.rb
#gathering RockPaperScissors from rock_paper_scissors.rb
require_relative "player.rb"
require_relative "rock_paper_scissors.rb"


#setting number of rounds to intiger zero
round = 0 
#initiating interaction, allowing user to select game
puts"Let's play a game, \n\ type rps for Rock, Paper, Sissors, Lizard, Spock \n\ \t or \n\ type ttt for Tic-Tac-Toe"
game_type = gets.chomp.downcase

#creating an instance of the game the person chooses to play
if game_type == "rps"
 rps_game = RockPaperScissors.new
else
  abort puts "Sorry that game is not available at this time"
end

# asking how many rounds they'd like to play for best of, making sure it's an intiger and between 3-100 
# returns what they input
begin
  puts "But first lets play best of, rather then one game.\n\How many rounds would you like to play?"
  rounds = gets.chomp.to_i
end until rounds > 2 && rounds <100
#verifying how many rounds they want to play because I want it to
puts "Let's play #{rounds} rounds"

#asking for player1's name 
#storing it as name 1 and capitalizing it
puts "Player 1 what is your name?"
name1 = gets.chomp.capitalize
#running an instance of that player
player1 = Player.new(name1)
#sending that instance to rps_game for storing
rps_game.player1 = player1

# getting player two's name 
#storing it as name 2 and capitalizing it
puts "Player 2 what is your name?"
name2 = gets.chomp.capitalize
#running an instance of that player
player2 = Player.new(name2)
#sending that player instance to rps_game instance for storing
rps_game.player2 = player2

#starting the until loop of rock paper scissors, they play until there's a winner 
# of best of # of rounds entered above
begin
  
#asking for name 1's choice
puts "#{name1} please enter your choice for rock, paper, scissors, lizard, spock"
player1_decision = gets.chomp.downcase

#looping for valid move
until rps_game.rps_valid_move(player1_decision) do
  puts " not a valid option, try agian"
  player1_decision = gets.chomp.downcase
end

#sending player1's move to player.rb to have player.rb push to Array (because I want to eventually pull up history)
player1.player_decision(player1_decision)

#gathering player 2's choice
puts "#{name2} please enter your choice"
player2_decision = gets.chomp.downcase

#looping to make sure player 2 enters valid option
until rps_game.rps_valid_move(player2_decision) do
  puts " Not a valid option, try agian"
  player2_decision = gets.chomp.downcase
end

#sending player2's move to player.rb to collect (because I want to eventually pull up history)
player2.player_decision(player2_decision)

#declares the winner of the round by using RockPaperScissors method rps_winner 
#arugments needed player1_decision and player2_decision in string form
puts rps_game.rps_winner(player1_decision, player2_decision)
  

#displaying players names from RockPaperScissors and respective scores from player.rb
#rps.game = current game
#player1 = player one of that current game
#name = name of that current player one of the current game
puts "#{rps_game.player1.name} #{player1.grand_total} #{rps_game.player2.name} #{player2.grand_total}"

#end for the begin loop goes until one person is clear victor. Wins has 1 more then half of rounds wanted.
end until  player1.grand_total == ((rounds/2)+1).to_i || player2.grand_total == ((rounds/2)+1).to_i 
round += 1

#once there's a best of victor it ends the game and declairs the victor
#
# returns true
puts "\n Game over!"
if player1.grand_total > player2.grand_total
  puts "#{player1.name} wins with #{player1.grand_total} points and #{rps_game.player1.player_decisions} moves."
else player2.grand_total > player1.grand_total
  puts "#{player2.name} wins with #{player2.grand_total} points and #{rps_game.player1.player_decisions} moves."
end
