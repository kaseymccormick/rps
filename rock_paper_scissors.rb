class RockPaperScissors
  def initalize
  end
  #array of possible moves
  possible_moves = ["rock", "paper", "scissors"]
  #hash of winning pairs winner:key loser:value
  winner = {"rock" => "scissors", "scissors" => "paper", "paper" => "rock" }
  
  #user started game, need to collect inforamtion to initiate player
  #take name from app.rb and give to player class
  def
  end
end
=begin

For example:The driver should begin by making a new game, and the game object should be responsible 
for creating the player objects.

The game class is a better place to store the logic for how a single game's winner is determined.

The game class is a better place to store the logic for how a best-of-n match's winner is determined.

The driver should mostly just be calling methods on the Game object, checking what the result 
of the method is, and then outputting some text on that basis.

The Player object isn't really a good place to store the rules for what a valid move is. 
Move that logic into the Game class.
=end


