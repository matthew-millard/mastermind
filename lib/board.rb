# frozen_string_literal: true

require_relative 'row'
require_relative 'peg'

class Board
  attr_accessor :rows

  def initialize
    @rows = Array.new(12) { Row.new }
  end

  def display
    puts '╔═══════════════════════════════════════════════════════════╗'
    puts '║                    MASTERMIND BOARD                       ║'
    puts '╠═══════════════════════════════════════════════════════════╣'
    rows.each_with_index do |row, index|
      print "║ Turn #{(index + 1).to_s.rjust(2)} │ "
      row.pegs.each { |peg| print "#{peg} " }
      print '│ Feedback: '
      if row.feedback_pegs.empty?
        print '        ' # 8 spaces to match width of 4 pegs with spacing
      else
        row.feedback_pegs.each { |feedback| print "#{feedback} " }
        # Pad with spaces if less than 4 feedback pegs
        (4 - row.feedback_pegs.length).times { print '  ' }
      end
      puts '║'
    end
    puts '╚═══════════════════════════════════════════════════════════╝'
    puts ''
    puts 'Legend: ● (black) = correct position & color, ○ (white) = correct color only'
  end
end
