$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require_relative '../lib/bottles'

require "minitest/autorun"
require 'minitest/pride'
require "minitest/reporters"
Minitest::Reporters.use!
# Minitest::Reporters.use! unless ENV['RM_INFO']