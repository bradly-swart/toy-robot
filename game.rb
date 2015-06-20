#main game loop: world setup, read input
require 'pry'

class Game
  def initialize
  end

  def run!
    while true do
      read_input
      update
    end
  end

  def update
    p 'updating game state'
  end

  def read_input
    input = gets.chomp.downcase
    p "received:#{input}"
    if valid_input(input)
     case input
     when 'quit'
        p 'Thanks for playing!'
        exit(0)
     else
       # if no case was found for current input?
       # smells fishy as this doubles up valid_input method
     end
    else
      p "invalid input:#{input}"
    end
  end

  def valid_input(input)
    valid_inputs = ['quit', 'place', 'report', 'move', 'left', 'right']
    if valid_inputs.include?(input)
      return true
    else
      return false
    end
  end
end

game = Game.new
game.run!
