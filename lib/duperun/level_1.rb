class Level1 < Chingu::GameState
  traits :viewport, :timer

  def initialize(options = {})
    super

    self.input = { :escape => :exit }
    self.viewport.game_area = [0, 0, 3500, 2000]

    @tile_width = @tile_height = 60
    @tileset = Gosu::Image.load_tiles($window, "media/tileset.png", @tile_width, @tile_height, true)

    @player = Player.create(:x => 100, :y => 400)

    $window.caption = "Dupe Run! (Level One)"

    # An attempt at map building.
    lines = File.readlines("media/lvl1.txt").map { |line| line.chomp }
    @height = lines.size
    @width = lines[0].size
    @tiles = Array.new(@width) do |x|
      Array.new(@height) do |y|
        case lines[y][x, 1]
        when '"'
          GrassBlock.create({:x => x, :y => y})
        when '#'
          Block.create({:x => x, :y => y})
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

  def draw
    super
  end
end
