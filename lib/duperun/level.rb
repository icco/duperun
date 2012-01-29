# Base Level class

class Level < Chingu::GameState
  traits :viewport, :timer

  def initialize(options = {})
    super options

    $window.caption = "Dupe Run! (#{self.class})"

    self.viewport.game_area = [0, 0, 3500, 2000]

    @tile_width = @tile_height = 60
    @tileset = Gosu::Image.load_tiles($window, "media/tileset.png", @tile_width, @tile_height, true)

    @player = Player.create(:x => 100, :y => 400)

    self.input = {
      :escape => :exit,
      :tab => :switch,
    }

    # An attempt at map building.
    lines = File.readlines(@level_map).map { |line| line.chomp }
    @height = lines.size
    @width = lines[0].size
    @tiles = Array.new(@width) do |x|
      Array.new(@height) do |y|
        case lines[y][x, 1]
        when '"'
          GrassBlock.create({:x => x*50, :y => y*50})
        when '#'
          Block.create({:x => x*50, :y => y*50})
        else
          nil # Do Nothing!
        end
      end
    end
  end

  def update
    super

    self.viewport.center_around(@player)
  end

  def switch
    i = (@player.which + 1) % Player.all.size
    @player.active = false
    @player = Player.all[i]
    @player.active = true

    DupeRun.log "Switched to Player ##{@player.which} of #{Player.all.count}."
  end
end