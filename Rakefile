# encoding: utf-8

require 'rubygems'
require 'bundler'
require 'rake'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake/clean'
CLEAN.include("data.db")

desc "Run the DupeRun game."
task :run do
  sh "ruby -Ilib ./bin/duperun"
end
