require "pry"
require "set"

require "./human"
require "./computer"

class Game
  def initialize(x_s, o_s, player_type, spaces)
    @x_s = x_s
    @o_s = o_s
    @player_type = player_type
    @spaces = spaces
    @x_moves = Set.new
    @o_moves = Set.new
  end

  def win?
    threeInRow = [Set.new([1, 2, 3]), Set.new([4, 5, 6]),
    Set.new([7, 8, 9]), Set.new([1, 4, 7]), Set.new([2, 5, 8]),
    Set.new([3, 6, 9]), Set.new([1, 5, 9]), Set.new([3, 5, 7])]

    result = false

    8.times do |threes|
      if @x_moves >= threeInRow[threes] ||
        @o_moves >= threeInRow[threes]
        result = true
      end
    end
    result
  end

  def total_moves
    total = @x_moves + @o_moves
    t = total.length
    t
  end

  def current_player
    total_moves % 2 == 0? cp = @x_s : cp = @o_s
    cp
  end

  def board
    9.times do |space|
      if @x_moves.include?(@spaces[space])
        @spaces[space] = "X"
      elsif @o_moves.include?(@spaces[space])
        @spaces[space] = "O"
      end

      if space % 3 == 0
        print "\n"
      else
        print " | "
      end
      print @spaces[space]
    end
    puts
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
    c = Computer.new(@spaces)
    comp = c.easy_computer

    if !(player.include?"Computer")
      turn = human_v_human_turn(player)
    else
      puts "Computer's turn"
      turn = comp
    end
    turn
  end

  def comp_v_comp_turn(player)
    c = Computer.new(@spaces)
    comp = c.easy_computer

    if player == @x_s
      puts "Computer 1's turn"
    elsif player == @o_s
      puts "Computer 2's turn"
    end
    turn = comp
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
    turn
  end

  def ticTacToe
    available_moves = Set.new(@spaces)

    until game_over
      puts
      sleep 0.4
      board
      turn = take_turn(current_player)
      if current_player == @x_s && available_moves.include?(turn)
        @x_moves.add(turn)
        puts "#{@x_s} selects #{turn}."
      elsif available_moves.include?(turn)
        @o_moves.add(turn)
        puts "#{@o_s} selects #{turn}."
      end
      available_moves.delete(turn)
    end
    board
    postmortem
  end

  def game_over
    @spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    win? || total_moves == 9
  end

  def postmortem
    current_player == @x_s? winner = @o_s : winner = @x_s

    if win?
      puts "Congratulations #{winner}!!!! You won!"
    elsif total_moves == 9
      puts "Tie!"
    end
  end
end
