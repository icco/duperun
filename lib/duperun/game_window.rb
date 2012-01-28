class GameWindow < Gosu::Window
  attr_reader :map
  attr_accessor :players

  def initialize
    @players = []
    super(
      CONFIG[:window][:width],
      CONFIG[:window][:height],
      false
    )

    @@center = [
      CONFIG[:window][:width] / 2,
      CONFIG[:window][:height] / 2,
    ]

    @background_image = Gosu::Image.new(self, "media/lines.png", true)

    self.caption = "Dupe Run!"

    @map = Map.new(self, "media/lvl1.txt")

    @player = Player.new(self, 400, 100)
  end

  def update
    @player.accelerate_left   if button_down? Gosu::KbLeft or button_down? Gosu::KbA or button_down? Gosu::GpLeft
    @player.accelerate_right  if button_down? Gosu::KbRight or button_down? Gosu::KbD  or button_down? Gosu::GpRight

    @camera_x = [ [@player.x - @@center[0], 0].max, @map.width * 50 - CONFIG[:window][:width]  ].min
    @camera_y = [ [@player.y - @@center[1], 0].max, @map.height * 50 - CONFIG[:window][:height] ].min

    @player.move
  end


  def draw
    @background_image.draw(0, 0, 0);

    translate(-@camera_x, -@camera_y) do
      @map.draw
      @player.draw
    end
  end

  def button_down(id)

    # The all important GTFO button.
    close if id == Gosu::KbEscape

    @player.jump if id == Gosu::KbUp or id == Gosu::KbSpace

  end
end
