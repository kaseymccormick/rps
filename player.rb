class Player
  
  #writing and reading name players name, player_decisions rock paper scissors et and grand_total ongoing score tally
  attr_accessor :name, :player_decisions, :grand_total
  #only thing required is name, i'm adding this person to start tallying up score 
  def initialize (name)
    @name = name
    @player_decisions = []
    @grand_total = 0
  end  
  
  #method player_decision requires playerx_decision from app.rb and stores it in a player_decisions array
  #
  #returns nill if empty or the array if multiple moves
  def player_decision(decision)
    player_decisions.push(decision)
  end
  
  #method player_score requires score *in int. form* to tally up the score in grand_total
  #returns grand total score in int. form
  def player_score(score)
    @grand_total += (score)
  end
  
end
  
  





  
