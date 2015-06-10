# Rock Paper Scissors explanation

## The assignment
Create a command line application that would play rock, paper, scissors, lizard, spock with two users in a best of round match.

## My solution summary
I chose to create the logic in one document, add the lizard spock element and then break it out into two classes and three files. app.rb is the driver, which collects which game to initiate then supply the necissary information to the RockPaperScissors and Player classes. I also chose to record the players moves. 
[Full code file *includes app.rb, rock_paper_scissor.rb, player.rb*] (https://gist.github.com/kaseymccormick/8d5578a5f0e6b31c3da3)

### class RockPaperScissors
Has an array of possible moves, a hash with winner key and loser Array value and handles checking if the player inputs a valid move, who the winner of the round is. And adding a point to that victor's score. There are no required arguments but I do accessor player1, player2 and victor.
''' Ruby
  attr_accessor :player1, :player2, :victor
  def initalize
    @decision
    @victor
  end
'''

Attributes used
 - decision -> used to store the persons decision for that play and history of plays, further explination in behaviros 
 - victor -> i make an attribute because I want access to this information through out the scope of this classs and other classes use through out the program.
''' Ruby
  attr_accessor :player1, :player2, :victor
  def initalize
    @decision
    @victor
  end
'''

Behaviors used
  - possible_moves -> a string array of moves allowed
  - winner -> a hash with key as winner and loser array as value
  - rps_valid_move(decision) -> takes the players decision in string form and checks it's a valid move returns boolean
  - rps_winner -> requires two strings outputs one string
  - score_incrementor -> requires a string outputs intiger
  
**possible_moves** 
Created to hold a list of acceptable moves in string form.

```ruby
  def possible_moves
    ["rock", "paper", "scissors", "lizard", "spock"]
  end
```

**winner** 
A place to store winner loser logic via a hash with key as winner and loser array as value.
```ruby
  def winner
    {:rock => ["scissors", "lizard"], :scissors => ["paper", "lizard"], 
              :paper => ["rock", "spock"], :lizard => ["spock", "paper"], 
              :spock => ["rock", "scissors"]}
  end
```

**rps_valid_move**
Requires the player's decision to verify if it is in the possible_moves array.
'''ruby
  def rps_valid_move(decision)
    possible_moves.include?(decision)
  end
'''

**rps_winner**
takes players decisions in string form and sees if there is a winner returns nil, player1.name (string) or player2.name (string). Also sends the score incrementor the victor's name

'''ruby
  def rps_winner (player1_decision, player2_decision)
    if player2_decision.to_sym == player1_decision.to_sym
      @victor =  nil
    elsif winner[player1_decision.to_sym].include?(player2_decision.to_s)
      @victor = player1.name
      score_incrementor(victor) 
    else 
      @victor = player2.name
      score_incrementor(victor)
    end   
    @victor  
  end
'''

**score_incrementor**
Gives the winner one more point by getting the vitors name and giving them 1 point.
'''ruby
  def score_incrementor(victor)
    if victor == player1.name
      player1.player_score(1)
    else 
      player2.player_score(1)
    end
  end
'''

### class Player
Keeps track of the players name for that best of round, keeps an player decision history in an array and keeps track of the score.

Attributes used
  - name -> specific best of game players names
  - player_decisions -> empty array
  - grand_total -> set to zero 
```ruby
 def initialize (name)
    @name = name
    @player_decisions = []
    @grand_total = 0
  end
```

  I attr_accessor :name, player_decision and grand_total but only require name to initialize a player instance. 
    

Behaviors used
  - player_decision -> requires the string of decision outputs array
  - player_score  -> requires the Intiger of amount to increment outputs total tally of scores
  
  **player_decision**
  app.rb sends the player's decision to Player class to be stored in the player_decisions array
  ```ruby
  def player_decision(decision)
    player_decisions.push(decision)
  end
  ```
  **player_score**
  Keeps a running tally of both players scores by getting the intiger of how much to incrament from RockPapaerScissors
  ```ruby
  def player_score(score)
    @grand_total += (score)
  end
  ```
  
