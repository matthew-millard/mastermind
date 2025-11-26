# frozen_string_literal: true

require_relative 'peg'

# Row class - represents a single guess row on the board
class Row
  attr_accessor :pegs

  def initialize
    @pegs = Array.new(4, nil) # Will hold 4 Peg objects (or nil for empty)
  end
end
