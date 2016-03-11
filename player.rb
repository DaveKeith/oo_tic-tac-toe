require "pry"
require "set"

class Player
  def initialize
    @games_played = 0
    @moves = Set.new
  end

  def moves
    @moves
  end

  def set_game_number
    @games_played += 1
  end

  def get_games_played
    @games_played
  end
end
