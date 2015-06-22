class Robot

  attr_accessor :cur_x,
                :cur_y,
                :cur_direction,
                :spawned

  def initialize
    @cur_direction, @cur_x, @cur_y = nil
    @spawned = false
    @directions = [:north, :east, :south, :west]
  end

  def place(x, y, direction, table)
    if table.valid_coords?(x, y) && valid_direction(direction)
      @cur_x         = x
      @cur_y         = y
      @cur_direction = direction
      @spawned       = true

      return true
    else
      return false
    end
  end

  def placed?
    return spawned
  end

  def rotate(direction)
    cur_index = @directions.index @cur_direction
    case direction
    when :left
      new_direction(cur_index-1)
    when :right
      new_direction(cur_index+1)
    else
      raise RotateError
    end
  end

  def report
    get_position.join(',')
  end

  def get_position
    return @cur_x, @cur_y, @cur_direction
  end

  def move(table)
    return unless placed?
    new_x, new_y = new_position
    if table.valid_coords?(new_x, new_y)
      @cur_x = new_x
      @cur_y = new_y
    end
  end

  private

    def new_position
      new_x = @cur_x
      new_y = @cur_y
      case @cur_direction
      when :north
        new_y = @cur_y + 1
      when :east
        new_x = @cur_x + 1
      when :south
        new_y = @cur_y - 1
      when :west
        new_x = @cur_x - 1
      end

      return new_x, new_y
    end

    def valid_direction(direction)
      return true if @directions.include?(direction)
    end

    def new_direction(index)
      if index == -1
        @cur_direction = @directions.last
      elsif index == @directions.size
        @cur_direction = @directions.first
      else
        @cur_direction = @directions[index]
      end
    end

end

class RotateError < StandardError
  def message
         "Invalid rotation, expecting left or right."
  end
end
