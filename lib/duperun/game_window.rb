class GameWindow < Chingu::Window
  def initialize
    super(CONFIG[:window][:width], CONFIG[:window][:height])
  end

  def setup
    retrofy
    switch_game_state(Level1)
  end    
end
