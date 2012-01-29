class GameWindow < Chingu::Window
  attr_reader :map
  attr_accessor :players

  def initialize
    @@sounds = {}

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

    @bg = Gosu::Image.new(self, "media/space.png", true)

    @map = Map.new(self, "media/lvl1.txt")

    @players = [Player.new(self, 400, 200)]
    @current_player = 0

    @camera_x = @camera_y = 0
  end

  def update
    self.player.accelerate_left   if button_down? Gosu::KbA or button_down? Gosu::GpLeft
    self.player.accelerate_right  if button_down? Gosu::KbD or button_down? Gosu::GpRight

    @camera_x = [ [self.player.x - @@center[0], 0].max,  @map.width * 50 - CONFIG[:window][:width]  ].min
    @camera_y = [ [self.player.y - @@center[1], 0].max, @map.height * 50 - CONFIG[:window][:height] ].min

    @players.each do |pl|
      pl.move
    end
  end


  def draw
    @bg.draw 0, 0, ZOrder::Background

    #DupeRun.log [@camera_x, @camera_y, player.x, player.y].inspect
    @players.each do |pl|
      pl.draw if @players.index pl != @current_player
    end

    self.translate(-@camera_x, -@camera_y) do
      @map.draw
      self.player.draw
    end
  end

  def button_down(id)

    # The all important GTFO button.
    close if id == Gosu::KbEscape

    self.player.jump if id == Gosu::KbSpace or id == Gosu::KbW
    self.new_player(self.player) if id == Gosu::KbS
    self.next_player if id == Gosu::KbTab
  end

  def player
    return @players[@current_player]
  end

  def next_player
    @current_player = (@current_player + 1) % @players.length
    DupeRun.log "Now: #{@current_player}"
  end

  def new_player pl
    @players.push(Player.new(self, pl.x, pl.y))
    @current_player = @players.length - 1

    DupeRun.log "New Player!: #{@players.inspect}"

    return
  end

  def play what
    case what
    when "jump"
      @@sounds[what] = Gosu::Sample.new(self, "media/jump.wav") if @@sounds[what].nil?
    end

    @@sounds[what].play if @@sounds[what]
  end
end
