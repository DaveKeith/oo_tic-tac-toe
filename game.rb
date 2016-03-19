require "pry"
require "set"

require "./turns"
require "./board"

class Game
  def initialize(x_s, o_s, player_type)
    @b = Board.new(x_s, o_s)
    @x_s = x_s
    @o_s = o_s
    @player_type = player_type
    @spaces = @b.get_spaces
    @record = 0
  end

  def set_x_moves(turn)
    @b.x_moves.add(turn)
  end

  def set_o_moves(turn)
    @b.o_moves.add(turn)
  end

  def tic_tac_toe
    available_moves = Set.new(@spaces)
    t = Turns.new(@x_s, @o_s, @player_type)
    until @b.game_over
      puts
      sleep 0.4
      @b.board
      available_moves.length % 2 == 1? player = @x_s : player = @o_s
      turn = t.take_turn(player)
      if player == @x_s && available_moves.include?(turn)
        set_x_moves(turn)
        puts "#{@x_s} selects #{turn}."
      elsif available_moves.include?(turn)
        set_o_moves(turn)
        puts "#{@o_s} selects #{turn}."
      end
      available_moves.delete(turn)
    end
    @b.board
    @b.postmortem
    set_record(@b.result_num)
  end

  def set_record(num)
    @record = num
  end

  def get_record
    @record
  end
end
