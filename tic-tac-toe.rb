require "pry"
require "set"

require "./human"
require "./computer"
require "./game"

choice = 999
until choice.between?(0, 2)
  puts "How many humans are in this game (0, 1, or 2)?"
  choice = gets.chomp.to_i
end

spaces_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
x = nil
o = nil
x_s = nil
o_s = nil
comp1 = nil
comp2 = nil
x_moves = Set.new
o_moves = Set.new

if choice == 0
  puts "'X' is 'Computer 1', 'O' is Computer 2."
  x = Computer.new(spaces_array)
  x_s = "Computer 1"
  x_moves = x.comp_moves
  o = Computer.new(spaces_array)
  o_s = "Computer 2"
  o_moves = o.comp_moves
elsif choice == 1
  puts "Enter your name:"
  name1 = gets.chomp
  puts "Would you like to be 'X' or 'O' ('X' goes first):"
  x_or_o = gets.chomp.upcase
  until x_or_o == 'X' || x_or_o == 'O'
    x_or_o = gets.chomp.upcase
  end
  if x_or_o == "X"
    x = Human.new(name1)
    x_s = x.get_name
    x_moves = x.human_moves
    o = Computer.new(spaces_array)
    o_s = o.comp_name
    o_moves = o.comp_moves
  else
    x = Computer.new(spaces_array)
    x_s = x.comp_name
    x_moves = x.comp_moves
    o = Human.new(name1)
    o_s = o.get_name
    o_moves = o.human_moves
  end
elsif choice == 2
  puts "Player 'X', enter your name ('X' goes first):"
  name1 = gets.chomp
  x = Human.new(name1)
  x_s = x.get_name
  x_moves = x.human_moves
  puts "Player 'O', enter your name:"
  name2 = gets.chomp
  o = Human.new(name2)
  o_s = o.get_name
  o_moves = o.human_moves
end

play_game = 'y'
until play_game != 'y'
  t = Game.new(x_s, o_s, choice, spaces_array)
  t.ticTacToe
  puts "Do you want to play another game? ('y' for yes)"
  play_game = gets.chomp.downcase
end
