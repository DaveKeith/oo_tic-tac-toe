require 'minitest/autorun'
require "set"
require "pry"

require "./computer"
require "./game"
require "./human"

class GameTests < MiniTest::Test
  def test_human_gets_name
    dave = Human.new("Dave")
    assert dave.get_name == "Dave"
  end

  def test_comp_number_is_available_in_array
    some_array = ["O", "X", "O", "X", 5, "X", "O", "X", "O"]
    zero_to_eight = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    3.times do
      comp = Computer.new(zero_to_eight)
      the_answer = comp.easy_computer
      assert zero_to_eight.include?(the_answer), "gave back #{the_answer}"
    end
    3.times do
      comp = Computer.new(some_array)
      the_answer = comp.easy_computer
      assert the_answer == 4, "gave back #{the_answer}"
    end
  end

  def test_human_moves_are_functional_sets
    h = Human.new("Brit")
    assert h.human_moves.empty?
    h.human_moves.add("This is a test")
    h.human_moves.add("and another test")
    h.human_moves.add("and one more test")
    assert h.human_moves.size == 3
  end

  def test_comp_moves_are_functional_sets
    one_to_nine = [1..9]
    c = Computer.new(one_to_nine)
    assert c.comp_moves.empty?
    10.times do
      c.comp_moves.add(1)
    end
    assert c.comp_moves.size == 1
  end

  def test_game_preconditions_for_current_player_and_total_moves
    h1 = Human.new("Bob")
    h2 = Human.new("Bill")
    x_s = h1.get_name
    o_s = h2.get_name
    player_type = 2
    one_to_nine = [1..9]
    g = Game.new(x_s, o_s, player_type, one_to_nine)
    assert g.total_moves == 0
    assert g.current_player == x_s
  end

  def test_game_preconditions_have_no_winner_and_game_is_not_over
    h1 = Human.new("Bob")
    h2 = Human.new("Bill")
    x_s = h1.get_name
    o_s = h2.get_name
    player_type = 2
    one_to_nine = [1..9]
    g = Game.new(x_s, o_s, player_type, one_to_nine)
    refute g.win?
    refute g.game_over
  end
end
