require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)

require 'game_router'
require 'game_controller'
require 'board'
require 'player'
require 'show'

GameRouter.new.perform
