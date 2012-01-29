# Map class holds and draws tiles
class Map < Chingu::GameObject
  trait :bounding_box, :debug => false
  trait :collision_detection
  
  def self.solid
    all.select { |block| block.alpha == 255 }
  end

  def self.inside_viewport
    all.select { |block| block.game_state.viewport.inside?(block) }
  end

  def setup
    @image = Image["tileset.png"]
    @color = Color.new(0xff808080)
    cache_bounding_box
  end
end
