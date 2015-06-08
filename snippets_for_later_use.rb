game_answer = gets.chomp.capitalize.to_s
if game_answer == "Rock, Paper, Scissors"
  #then run rock paper scissors class
elsif game_answer == "Tic-tac-toe" || "Tic Tac Toe"
  # then run tick tac toe class
else 
  abort puts "Sorry that game is not available"
end

http://stackoverflow.com/questions/1820451/ruby-style-how-to-check-whether-a-nested-hash-element-exists
http://www.korenlc.com/nested-arrays-hashes-loops-in-ruby/

h = { "a" => 100, "b" => 200 }
h.has_value?(100)   #=> true
h.has_value?(999)   #=> false
ANSWER somewhere in here http://ruby-doc.org/core-2.1.1/Hash.html#method-i-each

resources: http://stackoverflow.com/questions/19154011/how-to-get-the-users-input-and-check-against-the-items-in-an-array

http://ruby-doc.org/core-2.1.1/Hash.html (look at fetch)
