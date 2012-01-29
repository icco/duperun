# Base file. Require this and it brings everything else together.
# @author Nat Welch (nat@natwelch.com)

# Base requires
require "rubygems"
require "bundler"
Bundler.require

# CONSTANTS
CONFIG = {
  :window => {
    :height => 600,
    :width =>  1000,
  },

  :steps => 6
}

class DupeRun
  def self.log msg
    time = Time.now
    puts "#{time.strftime("%D %T")}: #{msg}"
  end
end

module ZOrder
  Background, Map, Player, UI = *0..3
end

class Numeric
  def radians_to_vec2
    CP::Vec2.new(Math::cos(self), Math::sin(self))
  end
end

# Application requires. If you create a new class, put it here brosef!
require "duperun/game_window"
require "duperun/player"
require "duperun/map"
