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
    :width => 1000,
  },
}

# Application requires. If you create a new class, put it here brosef!
require "duperun/game_window"
