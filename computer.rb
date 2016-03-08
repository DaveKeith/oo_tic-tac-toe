require "pry"
require "set"

class Computer
  def initialize(spaces)
    @spaces = spaces
    @moves = Set.new
  end

  def comp_moves
    @moves
  end

  def easy_computer
    r = rand(9)
    while @spaces[r] == "X" || @spaces[r] == "O"
      r = rand(9)
    end
    r
  end
end
