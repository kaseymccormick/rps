class TicTacToe
  def initialize
  end
end
=begin
three arrays with three elements
arry [one, two, thre]e
arry [one, two, three]
arry [one, two, three]



=end 

grid = [["_","_","_"],["_","_","_"],["_","_","_"]]
puts grid.inspect
grid[0,1]="x"
grid[0,0] = "o"
puts grid

matrix = {:row1 => [nil, nil, nil], "row2" => [nil, nil, nil],"row3" => [nil, nil, nil]}


puts matrix.each_value {|value| puts value }

#sets the board vertical lines
board   = [[nil,nil,nil],
           [nil,nil,nil],
           [nil,nil,nil]]



puts board.map { |row| row.map { |e| e || " " }.join("|") }.join("\n")
  