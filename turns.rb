require "pry"
require "set"

require "./board"

class Turns
  def initialize(x_s, o_s, player_type)
    @x_s = x_s
    @o_s = o_s
    @player_type = player_type
    @filled_spaces = Set.new
    @win_sets = [Set.new([1, 2, 3]), Set.new([4, 5, 6]),
        Set.new([7, 8, 9]), Set.new([1, 4, 7]), Set.new([2, 5, 8]),
        Set.new([3, 6, 9]), Set.new([1, 5, 9]), Set.new([3, 5, 7])]
  end

  def board_array
    b = Board.new(@x_s, @o_s)
    b.set_board(@filled_spaces)
    b.get_spaces
  end

  def computer
    r = rand(9)
    while board_array[r] == "C"
      r = rand(9)
    end
    board_array[r]
  end

  def human_v_human_turn(player)
    if player == @x_s
      puts "#{@x_s}'s turn."
      puts "Where do you want to draw an 'X' (type a number 1-9)?:"
      turn = gets.chomp.to_i
    elsif player == @o_s
      puts "#{@o_s}'s turn."
      puts "Where do you want to draw an 'O' (type a number 1-9)?:"
      turn = gets.chomp.to_i
    end

    until (1..9).include?(turn)
      puts "Choose a different number: "
      turn = gets.chomp.to_i
    end
    turn
  end

  def human_v_comp_turn(player)
    if !(player.include?"Computer")
      turn = human_v_human_turn(player)
    else
      puts "Computer's turn"
      turn = computer
    end
    turn
  end

  def comp_v_comp_turn(player)
    if player == @x_s
      puts "Computer 1's turn"
    elsif player == @o_s
      puts "Computer 2's turn"
    end
    turn = computer
    turn
  end

  def take_turn(player)
    if @player_type == 2
      turn = human_v_human_turn(player)
    elsif @player_type == 1
      turn = human_v_comp_turn(player)
    else
      turn = comp_v_comp_turn(player)
    end
    set_filled_spaces(turn)
    turn
  end

  def set_filled_spaces(turn)
    @filled_spaces.add(turn)
  end
end
