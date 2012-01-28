class GameWindow < Gosu::Window
  def initialize
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

    @player = Player.new(self)
    @player.warp(@@center[0], @@center[1])
  end

  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.accelerate_left
    end

    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.accelerate_right
    end

    @player.move
  end


  def draw
    @background_image.draw(0, 0, 0);
    @player.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end
