require 'minitest/autorun'
require "set"
require "pry"

require "./player"
require "./game"
require "./record"

class GameTests < MiniTest::Test
  def test_moves_are_functional_sets
    plyr = Player.new
    assert plyr.moves.empty?
    plyr.moves.add("This is a test")
    plyr.moves.add("and another test")
    plyr.moves.add("and one more test")
    assert plyr.moves.size == 3
  end

  def test_set_and_get_game_number
    plyr = Player.new
    assert plyr.get_games_played == 0
    plyr.set_game_number
    assert plyr.get_games_played == 1
  end

  def test_game_preconditions_for_current_player_and_total_moves
    x_s = "Bill"
    o_s = "Bob"
    player_type = 2
    one_to_nine = [1..9]
    g = Game.new(x_s, o_s, player_type, one_to_nine)
    assert g.total_moves == 0
    assert g.current_player == x_s
  end

  def test_game_preconditions_have_no_winner_and_game_is_not_over
    x_s = "Dave"
    o_s = "Jan"
    player_type = 2
    one_to_nine = [1..9]
    g = Game.new(x_s, o_s, player_type, one_to_nine)
    refute g.win?
    refute g.game_over
  end

  def test_comp_number_is_available_in_array
    x_s = "Jo"
    o_s = "Bo"
    player_type = 0
    one_to_nine = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    g1 = Game.new(x_s, o_s, player_type, one_to_nine)
    some_array = ["O", "X", "O", "X", 5, "X", "O", "X", "O"]
    3.times do
      assert one_to_nine.include?(g1.computer), "gave back #{g1.computer}"
    end
    g2 = Game.new(x_s, o_s, player_type, some_array)
    3.times do
      assert g2.computer == 5, "gave back #{g2.computer}"
    end
  end

  def test_record_set_and_get_wins1
    r = Record.new
    assert r.get_wins1 == 0
    r.set_wins1
    assert r.get_wins1 == 1
  end

  def test_record_set_and_get_wins2
    r = Record.new
    assert r.get_wins2 == 0
    r.set_wins2
    assert r.get_wins2 == 1
  end
end
