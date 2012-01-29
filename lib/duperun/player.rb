# A player instance

class Player
  attr_reader :x, :y

  def initialize(window, x, y)
    @x = @y = 0.0
    @vel_x = @vel_y = 1.0
    @x, @y = x, y
    @map = window.map
    @image = Gosu::Image.new(window, "media/player.png", false)
    @angle = 90.0
  end

  def accelerate_right
    puts "--->"
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  def accelerate_left
    puts "<---"
    @vel_x -= Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  # TODO: Figure out how to deal with jumping.
  def jump
    puts "Jump!"
    if @map.solid?(@x, @y + 1) then
      @vel_y = -20
    end
  end

  def move
    @vel_y += 1 # GRAVITY!

    if @vel_x > 0 then
      @x += @vel_x if self.fit? 5, 0
    elsif @vel_x < 0 then
      @x += @vel_x if self.fit? -5, 0
    end

    @vel_x *= 0.95
    @vel_y *= 0.95

    # Vertical movement
    if @vel_y > 0 then
      @vel_y.to_i.times { if self.fit? 0, 1 then @y += 1 else @vel_y = 0 end }
    elsif @vel_y < 0 then
      (-@vel_y).to_i.times { if self.fit? 0, -1 then @y -= 1 else @vel_y = 0 end }
    end
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def fit? offs_x, offs_y
    # Check at the center/top and center/bottom for map collisions
    return (
      not @map.solid?(@x + offs_x, @y + offs_y) and
      not @map.solid?(@x + offs_x - 45, @y + offs_y - 45)
    )
  end
end
