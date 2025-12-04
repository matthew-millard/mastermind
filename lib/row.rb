require_relative 'peg'

class Row
  attr_accessor :pegs, :correct_position, :correct_color

  def initialize
    @pegs = Array.new(4) { Peg.new }
    @correct_position = 0
    @correct_color = 0
  end
end
