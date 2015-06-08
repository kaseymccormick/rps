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

#if player 1 and player 2's decisions are the same it's a tie puts that
if player2_decision.to_sym == player1_decision.to_sym
  puts "telepathic tie, no points awarded" 
#go into winner array see if player 2's decision converted to symbol is is a key. then look in the value's array for player 2's decision
elsif winner[player1_decision.to_sym].include?(player2_decision.to_s)
  puts "#{name1} triumphs" 
  player1.player_score(1)
#if player 1 didn't win then player 2 did  
else 
  puts "#{name2} triumphs" 
  player2.player_score(1) 
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
