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

    self.caption = "Dupe Run!"

    @map = Map.new(self, "media/lvl1.txt")

    @players = [Player.new(self, 400, 200)]
    @current_player = 0

    @camera_x = @camera_y = 0
  end

  def update
    player.accelerate_left   if button_down? Gosu::KbA or button_down? Gosu::GpLeft
    player.accelerate_right  if button_down? Gosu::KbD or button_down? Gosu::GpRight

    @camera_x = [ [player.x - @@center[0], 0].max,  @map.width * 50 - CONFIG[:window][:width]  ].min
    @camera_y = [ [player.y - @@center[1], 0].max, @map.height * 50 - CONFIG[:window][:height] ].min

    player.move
  end


  def draw
    #DupeRun.log [@camera_x, @camera_y, player.x, player.y].inspect
    @players.each do |pl|
      pl.draw if @players.index pl != @current_player
    end

    self.translate(-@camera_x, -@camera_y) do
      @map.draw
      player.draw
    end
  end

  def button_down(id)

    # The all important GTFO button.
    close if id == Gosu::KbEscape

    self.player.jump if id == Gosu::KbSpace
    self.new_player(self.player) if id == Gosu::KbW
    self.next_player if id == Gosu::KbTab
  end

  def player
    return @players[@current_player]
  end

  def next_player
    @current_player = (@current_player + 1) % @players.length
  end

  def new_player pl
    @players.push(Player.new(self, pl.x, pl.y))
    @current_player = @players.length - 1

    return
  end
end
