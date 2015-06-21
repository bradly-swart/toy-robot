#main game loop: world setup, read input
require 'pry'
require './robot.rb'
require './table.rb'
require './messages.rb'

class Game
  def initialize
    @robot = Robot.new
    @table = Table.new(5,5)
  end

  def run!
    Messages.display(:welcome)
    Messages.display(:instructions)
    while true do
      read_input
    end
  end

  def update_state
    p 'updating game state'
  end

  def read_input
    input = gets.chomp.downcase.split(' ', 2)
    p "received:#{input[0]}"
    return unless ready(input[0]) || input[0] == 'quit'

    case input[0]
      when 'place'
        p '*placing robot'
        place_coords = input[1].split(',', 3)
        place_robot(place_coords)
      when 'report'
        @robot.report
      when 'move'
        @robot.move
      when 'left'
        @robot.rotate(:left)
      when 'right'
        @robot.rotate(:right)
      when 'quit'
         Messages.display(:quit)
         exit(0)
    else
      Messages.display(:invalid_input, input[0])
    end
  end

  def ready(input)
    return true unless @robot.placed? == false
    if @robot.placed? == false && input == 'place'
      p 'robot not yet placed, we are now placing it'
      return true
    elsif @robot.placed? == false && input != 'place'
      p 'robot not yet placed, please issue a place command'
      return false
    end
  end

  def place_robot(place_coords)
    x = place_coords[0].to_i
    y = place_coords[1].to_i

    if @table.valid_coords?(x, y)
      @robot.place(x, y, place_coords[2])
    end
  end

end

Game.new.run!
