class Level1 < Chingu::GameState
  traits :viewport, :timer

  def initialize(options = {})
    super
    
    self.input = { :escape => :exit }
    self.viewport.game_area = [0, 0, 3500, 2000]    
    
    load_game_objects
    @player = Player.create(:x => 100, :y => 400)

    $window.caption = "Dupe Run! (Level One)"
  end

  def update    
    super
    
    self.viewport.center_around(@player)
  end
end
