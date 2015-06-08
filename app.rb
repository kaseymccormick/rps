=begin
Basic rock-paper-scissors game (probably no custom classes yet) on the command line. 
Should only accept valid moves. 
The program is over when a single round of RPS has been played. 
This is your app.rb – or the beginnings of it at least. 

Now create a Player class. Modify your "driver" (app.rb) to create players, prompt them for moves, and have them congratulated by name when they win. Player objects should have attributes for storing their name and their move (i.e. their choice of "weapon"). And, as before, only valid moves should be allowed. From the user’s perspective, the game should appear to work exactly the same – except the game calls the user by their name.
Modify the driver so that it lets players play a best-of-n match. This will require you to keep track of each player’s score.
=end
=begin
resources: http://stackoverflow.com/questions/19154011/how-to-get-the-users-input-and-check-against-the-items-in-an-array

http://ruby-doc.org/core-2.1.1/Hash.html (look at fetch)
=end
#gathering player class from player.rb
require_relative "player.rb"


#array of possible moves
possible_moves = ["rock", "paper", "scissors" , "lizard" , "spock"]
#hash of winning pairs winner:key loser:value
winner = {:rock => ["scissors", "lizard"], :scissors => ["paper", "lizard"], 
          :paper => ["rock", "spock"], :lizard => ["spock", "paper"], 
          :spock => ["rock", "scissors"]}
#setting round number to zero
round = 0 
#initiating game
puts "Would you like to play rock, paper, scissors? I need two volunteers"

# asking how many rounds they'd like to play for best of, making sure it's an intiger and between 3-100
begin
  puts "But first lets play best of, rather then one game.\n\ How many rounds would you like to play?"
  rounds = gets.chomp.to_i
end until rounds > 2 && rounds <100
#verifying how many rounds they want to play because i want to
puts "Let's play #{rounds} rounds"

#asking for player1's name and capitalizing it
puts "Volunteer 1 what is your name?"
name1 = gets.chomp.capitalize
#running an instance of that player
player1 = Player.new(name1)

# getting player two's name and capitalizing it
puts "Volunteer 2 what is your name?"
name2 = gets.chomp.capitalize
#running an instance of that player
player2 = Player.new(name2)


#starting the until loop of rock paper scissors, they play until there's a winner of best of # of rounds entered above
begin
#asking for name 1's choice
puts "#{name1} please enter your choice for rock, paper, scissors"
#verifying player 1's input
player1_decision = gets.chomp.downcase
#looping to make sure player1 enters valid option
until possible_moves.include?(player1_decision) do
  puts " not a valid option, try agian"
  player1_decision = gets.chomp.downcase
end

#sending player1's move to player.rb to collect (because I want to eventually pull up history)
player1.player_decision(player1_decision)



#gathering player 2's choice
puts "#{name2} please enter your choice"
#verifying player 2's input
player2_decision = gets.chomp.downcase
#looping to make sure player 2 enters valid option
until possible_moves.include?(player2_decision) do
  puts " Not a valid option, try agian"
  player2_decision = gets.chomp.downcase
end
#sending player2's move to player.rb to collect (because I want to eventually pull up history)
player2.player_decision(player2_decision)


#go into winner hash find player1's decision if that key's value is equal to player2's decision player 1 wins ifels find player 2 as key and compare to player 1 as value = player 2 wins else both are same it's a tie add points to winners.
#**************************BROKEN now that added lizard spock **************************************
if player2_decision.to_sym == player1_decision.to_sym
  puts "telepathic tie, no points awarded" 
  
#player 1 alwys wins
#need to find a way to get player1_decision included in the array in the value of playe2decisions key 

elsif winner.fetch(player2_decision.to_sym) == winner.each_value {|player1_decision|} 
  puts "#{name2} triumphs" 
  player2.player_score(1)
else winner.fetch(player1_decision.to_sym) == player2_decision.to_s
  puts "#{name1} triumphs" 
  player1.player_score(1) 
  puts winner[:rock]
  binding.pry 
end

#displaying players names and respective scores
puts " #{name1}'s score: #{player1.grand_total}\n\ #{name2}'s score: #{player2.grand_total}"

#end for the begin loop goes until one person is clear victor. Wins has 1 more then half.
end until  player1.grand_total == ((rounds/2)+1).to_i || player2.grand_total == ((rounds/2)+1).to_i 
round += 1

#once there's a best of victor it ends the game 
puts "\n Game over!"
if player1.grand_total > player2.grand_total
  puts " #{name1} wins!!"
elsif player2.grand_total > player1.grand_total
  puts " #{name2} wins!!"
else
  puts "You know eachother to well."
end
