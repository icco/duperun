# A player instance

class Player < Chingu::GameObject
  attr_reader :x, :y

  def inspect
    return "#<Player @y=#{@y}, @x=#{@x}, @vel_y=#{@vel_x}, @vel_x=#{@vel_x}>"
  end

  def initialize(window, x, y)
    @x = @y = 0.0
    @vel_x = @vel_y = 1.0
    @x, @y = x, y
    @map = window.map
    @window = window

    @height = @width = 50
    @standing, @walk1, @walk2, @jump = *Gosu::Image.load_tiles(window, "media/player2.png", @width, @height, false)

    @angle = 0.0
  end

  def accelerate_right
    DupeRun.log "--->"
    @vel_x += Gosu::offset_x(@angle+90, 0.5)
  end

  def accelerate_left
    DupeRun.log "<---"
    @vel_x -= Gosu::offset_x(@angle+90, 0.5)
  end

  def jump
    if @map.solid?(@x, @y + 1)
      @vel_y = -20
      @window.play "jump"
      DupeRun.log "Jump!"
    else
      DupeRun.log "Can't Jump."
    end
  end

  def move

    # Select image depending on action
    if @vel_x == 0
      @cur_image = @standing
    elsif @vel_y < 0
      @cur_image = @jump
    else
      @cur_image = (Gosu::milliseconds / 175 % 2 == 0) ? @walk1 : @walk2
    end

    @vel_y += 1 # GRAVITY!

    @vel_x *= 0.95
    @vel_y *= 0.95

    @x += @vel_x if self.fit? @vel_x, 0

    # Vertical movement
    if @vel_y > 0 then
      @vel_y.to_i.times { if self.fit? 0, 1 then @y += 1 else @vel_y = 0 end }
    elsif @vel_y < 0 then
      (-@vel_y).to_i.times { if self.fit? 0, -1 then @y -= 1 else @vel_y = 0 end }
    end
  end

  def draw
    @cur_image.draw_rot(@x, @y, 1, @angle, ZOrder::Player)
  end

  def fit? offs_x, offs_y
    # Check at the center/top and center/bottom for map collisions
    return (
      not @map.solid?(@x + offs_x, @y + offs_y) and
      not @map.solid?(@x + offs_x - 45, @y + offs_y - 45)
    )
  end
end
