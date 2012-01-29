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
          0
        when '#'
          1
        else
          nil
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

    @height.times do |y|
      @width.times do |x|
        tile = @tiles[x][y]
        if tile
          # Draw the tile with an offset (tile images have some overlap)
          # Scrolling is implemented here just as in the game objects.
          @tileset[tile].draw(x * 50 - 5, y * 50 - 5, ZOrder::Map)
        end
      end
    end
  end
end
