# frozen_string_literal: true

require_relative 'peg'
require 'colorize'

# Row class - represents a single guess row on the board
class Row
  attr_accessor :pegs, :feedback

  def initialize
    @pegs = Array.new(4, nil) # Will hold 4 Peg objects (or nil for empty)
    @feedback = { correct_position: 0, correct_color: 0 }
  end
end
