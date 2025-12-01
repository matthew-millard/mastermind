# frozen_string_literal: true

require 'colorize'

class Peg
  attr_accessor :color

  def initialize(color = nil)
    @color = color
  end

  def to_s
    return '○' if color.nil?

    case color
    when 'Red'    then '●'.colorize(:red)
    when 'Yellow' then '●'.colorize(:yellow)
    when 'Purple' then '●'.colorize(:magenta)
    when 'Green'  then '●'.colorize(:green)
    when 'Orange' then '●'.colorize(:light_red)
    when 'Blue'   then '●'.colorize(:blue)
    when 'Black'  then '●'.colorize(:black)
    when 'White'  then '○'.colorize(:white)
    else '○'
    end
  end
end
