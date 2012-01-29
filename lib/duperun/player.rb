# A player instance

class Player < Chingu::GameObject
  attr_reader :x, :y

  def inspect
    return "#<Player @y=#{@y}, @x=#{@x}, @vel_y=#{@vel_x}, @vel_x=#{@vel_x}>"
  end

end
