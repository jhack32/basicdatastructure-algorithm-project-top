#Project 2: Knight's Travails

class GameBoard
  attr_accessor :position, :path
  def initialize(position, path)
    @position = position
    @path = path
  end
end

def knight_moves(start, finish)
  queue = [GameBoard.new(start, [start])]
  visited = [start]
  while !queue.empty?
#First position the current
    current = queue.shift
#Find all possible moves that hasn't been visited.
    possible_moves = possible_moves(current.position).select { |m| !visited.include?(m)}
    if possible_moves.include?(finish)
      current.path << finish
      if current.path.size-1 == 1
        puts "You made it in #{current.path.size-1} moves! Here's your path:"
      else
        puts "You made it in #{current.path.size-1} moves! Here's your path:"
      end
      current.path.each {|position| puts position}
      return
    end
    possible_moves.each do |x|
      queue << GameBoard.new(x, (current.path + [x]))
      visited << x
    end
  end
end #End of knight_moves

def possible_moves(position)
  changes = [[-2,-1], [-2,1], [-1,-2], [2,-1], [2,1], [1,-2], [1,2]]
  moves = Array.new
  changes.each {|c| moves << [position[0] + c[0], position[1] + c[1]]}
  moves.select {|m| is_valid(m)}
end

def is_valid(position)
  if (position[0] > -1 && position[0] < 8) && (position[1] > -1 && position[1] < 8)
    true
  else
    false
  end
end
print knight_moves([3,3],[4,3])
