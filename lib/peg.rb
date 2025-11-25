# frozen_string_literal: true

# A coloured peg class
class Peg
  attr_reader :color

  PEG_COLORS = %w[Red Yellow Pink Green Orange Blue].freeze

  def initialize(color)
    @color = valid_color?(color)
  end

  def valid_color?(color)
    return color if PEG_COLORS.include?(color)

    raise ArgumentError, 'Invalid color provided as argument.'
  rescue ArgumentError => e
    puts e.message
  end
end
