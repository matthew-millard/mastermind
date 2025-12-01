# frozen_string_literal: true

require_relative 'peg'

class Row
  attr_accessor :pegs, :feedback_pegs

  def initialize
    @pegs = Array.new(4) { Peg.new }
    @feedback_pegs = []
  end
end
