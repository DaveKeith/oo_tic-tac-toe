require "pry"
require "set"

require "./game"
require "./board"

choice = 999
until choice.between?(0, 2)
  puts "How many humans are in this game (0, 1, or 2)?"
  choice = gets.chomp.to_i
end

x_win_count = 0
o_win_count = 0
ties = 0
x_s = nil
o_s = nil

if choice == 0
  puts "'X' is 'Computer 1', 'O' is Computer 2."
  x_s = "Computer 1"
  o_s = "Computer 2"
elsif choice == 1
  puts "Enter your name:"
  name1 = gets.chomp
  puts "Would you like to be 'X' or 'O' ('X' goes first):"
  x_or_o = gets.chomp.upcase
  until x_or_o == 'X' || x_or_o == 'O'
    x_or_o = gets.chomp.upcase
  end
  if x_or_o == "X"
    x_s = name1
    o_s = "Computer"
  else
    x_s = "Computer"
    o_s = name1
  end
elsif choice == 2
  puts "Player 'X', enter your name ('X' goes first):"
  name1 = gets.chomp
  x_s = name1
  puts "Player 'O', enter your name:"
  name2 = gets.chomp
  o_s = name2
end

b = Board.new(x_s, o_s)
play_game = 'y'
until play_game != 'y'
  t = Game.new(x_s, o_s, choice)
  t.tic_tac_toe
  if t.get_record == 1
    x_win_count += 1
  elsif t.get_record == 2
    o_win_count += 1
  else
    ties += 1
  end
  puts "#{x_s} wins = #{x_win_count}"
  puts "#{o_s} wins = #{o_win_count}"
  puts "Ties = #{ties}"
  puts "Do you want to play another game? ('y' for yes)"
  play_game = gets.chomp.downcase
end
