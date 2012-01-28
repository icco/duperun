# A player instance

class Player
  def initialize(window)
    @image = Gosu::Image.new(window, "media/player.png", false)
    @x = @y = @vel_x = @vel_y = 0.0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def accelerate_right
    @vel_x += Gosu::offset_x(@angle, 0.5)
  end

  def accelerate_left
    @vel_x += Gosu::offset_x(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= CONFIG[:window][:width]
    @y %= CONFIG[:window][:height]

    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
