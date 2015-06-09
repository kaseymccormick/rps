# creating RockPaperScissors blueprint
class RockPaperScissors
  #read/write player1 and player2 
  attr_accessor :player1, :player2
  def initalize
    #i want to collect the decision and store it so eventually can pull up a players history so decision is used multiple times for collection, helps to have it initialized. But i dont need the players decision to start a RockPaperScissors game.
    @decision
  end
  
  #array of possible moves
  # returns array of possible moves
  def possible_moves
    ["rock", "paper", "scissors", "lizard", "spock"]
  end
  
  #hash of winning pairs winner:key losers array:value
  def winner
    {:rock => ["scissors", "lizard"], :scissors => ["paper", "lizard"], 
              :paper => ["rock", "spock"], :lizard => ["spock", "paper"], 
              :spock => ["rock", "scissors"]}
  end
  
  #determines if a decision is valid for rock paper scissors 
  #
  #rps_valid_move - required decision in string downcase form
  #
  #Example:
  # rps_valid_move(rock)
  #   possible_moves.include?(rock)
  # => true or false
  #
  #returns true or false as it runs boolean to find if string is in the array of possible_moves
  def rps_valid_move(decision)
    possible_moves.include?(decision)
  end
  
  #Determines who wins by comparing players inputs first with eachother then with the winner hash
  #
  #rps_winner - requires two strings -> the player1_decision and player2_decision
  #
  #Example:
  #  rps winner ("rock","paper")
  #    if :paper = :rock 
  #      => it's a tie
  # elsif winner array has a key of :rock does the value's array include?(paper)  
  #      => player 1 wins
  # else 
  #      => player 2 wins
  #
  #returns nil , intiger, intiger
  def rps_winner (player1_decision, player2_decision)
    
    if player2_decision.to_sym == player1_decision.to_sym
      puts "telepathic tie, no points awarded" 
      
    elsif winner[player1_decision.to_sym].include?(player2_decision.to_s)
      puts "#{player1.name} triumphs" 
      player1.player_score(1)
      
    else 
      puts "#{player2.name} triumphs" 
      player2.player_score(1) 
    end   
    
  end
  
   binding.pry
  

  # adds to the players score if code elswhere privides a score amount to use with this method
  #
  # player_score - requires an intiger as argument
  #
  # Example:
  # player_score(1)    
  #   0 +=(1)
  # => 1 (given they started at zero)
  #
  #returns grand total score in Intiger form
  def player_score(score)
    @grand_total += (score)
  end
end



