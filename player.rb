=begin
Now create a Player class. Modify your "driver" (app.rb) to create players, prompt them for moves, 
and have them congratulated by name when they win. Player objects should have attributes for 
storing their name and their move (i.e. their choice of "weapon"). And, as before, only valid
 moves should be allowed. From the user’s perspective, the game should appear to work exactly 
the same – except the game calls the user by their name.
=end
class Player
  
  #writing and reading name players name, player_decisions rock paper scissors et and grand_total ongoing score tally
  attr_accessor :name, :player_decisions, :grand_total
  #only thing required is name, i'm adding this person to start tallying up score 
  def initialize (name)
    @name = name
    @player_decisions = []
    @grand_total = 0
  end  
  
  #method player_decision requires decision from app.rb and stores it in a player_decisions array
  #returns decision into array it can only be a one of three strings provided in the possible_moves array 
  def player_decision(decision)
    player_decisions.push(decision)
  end
  
  #method player_score requires score *in int. form* to tally up the score in grand_total
  #returns grand total score in int. form
  def player_score(score)
    @grand_total += (score)
  end
  
end
  
  #i want to create a hash {key : value} that the value is an array of moves and the key is the player
  #{frank => [rock, paper, scissors, scissors]





  
