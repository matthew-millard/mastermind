# frozen_string_literal: true

require_relative 'row'

# Board class
class Board
  attr_accessor :rows

  def initialize
    @rows = Array.new(12, Row.new)
  end

  def display
    puts "\n╔════════════════════════════════════════════════╗"
    puts '║                MASTERMIND BOARD                ║'
    puts '╠════════════════════════════════════════════════╣'

    rows.each_with_index do |row, index|
      print "║ Turn #{(index + 1).to_s.rjust(2)} │ "

      # Display guess pegs
      row.pegs.each do |peg|
        if peg.nil?
          print '[ ] '
        else
          print "[#{peg_symbol(peg.color)}] "
        end
      end

      print "│ Feedback: #{row.feedback}" # Space for feedback pegs
      puts ' ║'
    end

    puts '╚════════════════════════════════════════════════╝'
  end

  def peg_symbol(color)
    case color
    when 'Red'    then '●'.colorize(:red)
    when 'Yellow' then '●'.colorize(:yellow)
    when 'Purple' then '●'.colorize(:magenta)
    when 'Green'  then '●'.colorize(:green)
    when 'Orange' then '●'.colorize(:light_red)
    when 'Blue'   then '●'.colorize(:blue)
    else '○'
    end
  end
end
