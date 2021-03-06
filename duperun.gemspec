# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "duperun"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nat Welch"]
  s.date = "2012-01-29"
  s.description = "A platform game where penguins jump around."
  s.email = "nat@natwelch.com"
  s.executables = [".gitkeep", "duperun"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/.gitkeep",
    "bin/duperun",
    "duperun.gemspec",
    "lib/.gitkeep",
    "lib/duperun.rb",
    "lib/duperun/block.rb",
    "lib/duperun/game_window.rb",
    "lib/duperun/grass_block.rb",
    "lib/duperun/level.rb",
    "lib/duperun/level_one.rb",
    "lib/duperun/level_two.rb",
    "lib/duperun/player.rb",
    "media/.gitkeep",
    "media/jump.wav",
    "media/lines.png",
    "media/lvl1.txt",
    "media/lvl2.txt",
    "media/player.png",
    "media/player.pxm",
    "media/player2.png",
    "media/player2.pxm",
    "media/space.png",
    "media/tileset.png"
  ]
  s.homepage = "http://github.com/icco/duperun"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "A platform game involving penguins"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chingu>, [">= 0"])
      s.add_runtime_dependency(%q<gosu>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<rmagick>, [">= 0"])
      s.add_runtime_dependency(%q<sequel>, [">= 0"])
      s.add_runtime_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<ronn>, [">= 0"])
    else
      s.add_dependency(%q<chingu>, [">= 0"])
      s.add_dependency(%q<gosu>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<rmagick>, [">= 0"])
      s.add_dependency(%q<sequel>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<ronn>, [">= 0"])
    end
  else
    s.add_dependency(%q<chingu>, [">= 0"])
    s.add_dependency(%q<gosu>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<rmagick>, [">= 0"])
    s.add_dependency(%q<sequel>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<ronn>, [">= 0"])
  end
end

