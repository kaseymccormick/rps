class RockPaperScissors
  attr_accessor :player1, :player2
  def initalize
    @decision
  end
  
  #array of possible moves
  def possible_moves
    ["rock", "paper", "scissors", "lizard", "spock"]
  end
  #hash of winning pairs winner:key loser:value
  def winner
    winner = {:rock => ["scissors", "lizard"], :scissors => ["paper", "lizard"], 
              :paper => ["rock", "spock"], :lizard => ["spock", "paper"], 
              :spock => ["rock", "scissors"]}
  end
  #method for valid play
  def rps_valid_move(decision)
    possible_moves.include?(decision)
  end
  
  #method for who wins
  def rps_winner (player1_decision, player2_decision)
    # conditional statement figuring out who wins
    #if player 1 and player 2's decisions are the same it's a tie puts that
    if player2_decision.to_sym == player1_decision.to_sym
      puts "telepathic tie, no points awarded" 
    #go into winner array see if player 2's decision converted to symbol is is a key. then look in the value's array for player 2's decision
    elsif winner[player1_decision.to_sym].include?(player2_decision.to_s)
      puts "#{player1.name} triumphs" 
      player1.player_score(1)
    #if player 1 didn't win then player 2 did  
    else 
      puts "#{player2.name} triumphs" 
      player2.player_score(1) 
    end
    
  end
  

  #method player_score requires score *in int. form* to tally up the score in grand_total
  #returns grand total score in int. form
  def player_score(score)
    @grand_total += (score)
  end
end



