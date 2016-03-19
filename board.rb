require "pry"
require "set"

class Board
  def initialize(x_s, o_s)
    @x_s = x_s
    @o_s = o_s
    @x_moves = Set.new
    @o_moves = Set.new
    @x_wins = 0
    @o_wins = 0
    @spaces_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def get_spaces
    @spaces_array
  end

  def x_moves
    @x_moves
  end

  def o_moves
    @o_moves
  end

  def win?
    threeInRow = [Set.new([1, 2, 3]), Set.new([4, 5, 6]),
    Set.new([7, 8, 9]), Set.new([1, 4, 7]), Set.new([2, 5, 8]),
    Set.new([3, 6, 9]), Set.new([1, 5, 9]), Set.new([3, 5, 7])]
    result = false
    8.times do |threes|
      if x_moves >= threeInRow[threes] ||
        o_moves >= threeInRow[threes]
        result = true
      end
    end
    result
  end

  def total_moves
    total = x_moves + o_moves
    total
  end

  def current_player
    total_moves.length % 2 == 0? cp = @x_s : cp = @o_s
    cp
  end

  def set_board(total_moves)
    9.times do |space|
      if total_moves.include?(get_spaces[space])
        get_spaces[space] = "C"
      end
    end
  end

  def board
    9.times do |space|
      if x_moves.include?(get_spaces[space])
        get_spaces[space] = "X"
      elsif o_moves.include?(get_spaces[space])
        get_spaces[space] = "O"
      end
    end
    get_spaces.each_with_index do |space, index|
      if index % 3 == 0
        print "\n"
      else
        print " | "
      end
      print space
    end
    puts
  end

  def game_over
    @spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    get_spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    win? || total_moves == 9
  end

  def result_num
    result = 0
    if win?
      if current_player == @x_s
        result = 2
      else
        result = 1
      end
    end
    result
  end

  def postmortem
    if win?
      if current_player == @x_s
        winner = @o_s
      else
        winner = @x_s
      end
      puts "Congratulations #{winner}!!!! You won!"
    elsif total_moves == 9
      puts "Tie!"
    end
  end
end
