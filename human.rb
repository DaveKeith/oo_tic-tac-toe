require "pry"
require "set"

class Human
  def initialize(name)
    @name = name
    @moves = Set.new
  end

  def human_moves
    @moves
  end

  def get_name
    @name
  end
end
