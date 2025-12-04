class Peg
  attr_accessor :color

  def initialize
    @color = nil
  end

  def to_s
    color || '⚪️'
  end
end
