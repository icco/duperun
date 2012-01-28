class GameWindow < Gosu::Window
  def initialize
    super(
      CONFIG[:window][:width],
      CONFIG[:window][:height],
      false
    )

    self.caption = "Dupe Run!"
  end
end
