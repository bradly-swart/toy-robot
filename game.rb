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

  def read_input
    begin
      input = gets.chomp.downcase.split(' ', 2)
      return unless ready(input[0]) || input[0] == 'quit'

      case input[0]
        when 'place'
          place_coords = input[1].split(',', 3)
          placed = @robot.place(place_coords[0].to_i, place_coords[1].to_i, place_coords[2].downcase.to_sym, @table)
          if placed
            Messages.display(:successful_placement)
          else
            Messages.display(:invalid_placement)
          end
        when 'report'
          puts @robot.report
        when 'move'
          @robot.move(@table)
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
    rescue
       Messages.display(:input_error)
       Messages.display(:instructions)
    end
  end

  def ready(input)
    return true unless @robot.placed? == false
    if @robot.placed? == false && input == 'place'
      Messages.display(:robot_placement)
      return true
    elsif @robot.placed? == false && input != 'place'
      Messages.display(:robot_not_placed)
      return false
    end
  end

end

Game.new.run!
