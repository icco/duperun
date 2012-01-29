# A player instance

class Player < Chingu::GameObject
  trait :bounding_box, :scale => 0.80
  traits :timer, :collision_detection , :timer, :velocity

  attr_reader :jumping

  def inspect
    return "#<Player @y=#{@y}, @x=#{@x}, @vel_y=#{@vel_x}, @vel_x=#{@vel_x}>"
  end

  def setup
    self.input = {
      [:holding_left, :holding_a] => :holding_left,
      [:holding_right, :holding_d] => :holding_right,
      [:up, :w] => :jump,
    }

    @width = @height = 50
    @standing, @walk1, @walk2, @jump = *Image.load_tiles($window, "media/player2.png", @width, @height, false)
    @image = @standing

    @speed = 3
    @jumping = false

    self.zorder = 300
    self.factor = 3
    self.acceleration_y = 0.5
    self.max_velocity = 10
    self.rotation_center = :bottom_center

    update
    cache_bounding_box
  end

  def holding_left
    move(-@speed, 0)
  end

  def holding_right
    move(@speed, 0)
  end

  def jump
    return if @jumping
    @jumping = true
    self.velocity_y = -10
    @image = @jump
  end

  def move(x,y)
    self.x += x
    self.each_collision(Map) do |me, stone_wall|
      self.x = previous_x
      break
    end

    self.y += y
  end

  def update
    self.each_collision(Map) do |me, stone_wall|
      if self.velocity_y < 0  # Hitting the ceiling
        me.y = stone_wall.bb.bottom + me.image.height * self.factor_y
        self.velocity_y = 0
      else  # Land on ground
        @jumping = false
        me.y = stone_wall.bb.top-1
      end
    end

    @image = (Gosu::milliseconds / 175 % 2 == 0) ? @walk1 : @walk2
  end
end
