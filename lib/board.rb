# frozen_string_literal: true

require_relative 'row'

# Board class
class Board
  attr_accessor :rows

  def initialize
    @rows = Array.new(12, Row.new)
  end
end
