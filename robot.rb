class Robot

  attr_accessor :cur_x,
                :cur_y,
                :cur_direction,
                :spawned

  def initialize
    @cur_direction, @cur_y, @cur_y = nil
    @spawned = false
  end

  def place(x, y, direction)
    @cur_x         = x
    @cur_y         = y
    @cur_direction = direction
    @spawned       = true
  end

  def placed?
    return spawned
  end

  def rotate(direction)
    case direction
    when :left

    when :right

    else
      p 'invalid direction'
    end
  end

  def report
    #report robot's current position
    p "#{get_position.join(',')}"
  end

  def get_position
    return @cur_x, @cur_y, @cur_direction
  end

  def move

  end

end
