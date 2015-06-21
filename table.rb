class Table

  attr_reader :x, :y, :map

  def initialize(x,y)
    @x = (0...x.to_i).to_a
    @y = (0...y.to_i).to_a
    @map = [@x,@y]
  end

  def valid_coords?(x,y)
    if @map[0].include?(x) && @map[1].include?(y)
      return true
    else
      return false
    end
  end

end
