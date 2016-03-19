require 'minitest/autorun'
require "set"
require "pry"

require "./board"
require "./game"
require "./turns"

class GameTests < MiniTest::Test
  def test_game_preconditions_for_current_player_and_total_moves
    b = Board.new("Kat", "Matt")
    assert b.total_moves.length == 0
    assert b.current_player == "Kat"
  end

  def test_game_preconditions_have_no_winner_and_game_is_not_over
    b = Board.new("Dave", "Lee")
    refute b.win?
    refute b.game_over
  end

  def test_comp_generates_random_num_between_1_and_9
    t = Turns.new("Don", "Ron", 0)
    one_to_nine = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    10.times do
      assert one_to_nine.include?(t.computer)
    end
  end

  def test_filled_spaces_can_be_set_and_change_board_array
    t = Turns.new("Red", "Rod", 0)
    count = 0
    t.board_array.each do |space|
      if space == "C"
        count += 1
      end
    end
    assert count == 0
    t.set_filled_spaces(1)
    t.set_filled_spaces(4)
    t.set_filled_spaces(9)
    t.set_filled_spaces(2)
    count = 0
    t.board_array.each do |space|
      if space == "C"
        count += 1
      end
    end
    assert count == 4
  end

  def test_game_runs_and_returns_nil
    g = Game.new("Dee", "Ty", 0)
    g.tic_tac_toe == nil
  end

  def test_record_set_and_get_record
    g = Game.new("Jay", "Fay", 0)
    assert g.get_record == 0
    g.set_record(1)
    assert g.get_record == 1
  end
end
