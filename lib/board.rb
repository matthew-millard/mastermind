require_relative 'game'
require_relative 'row'

class Board
  attr_reader :rows

  def initialize(num_of_rows)
    @rows = Array.new(num_of_rows) { Row.new }
  end

  def display # rubocop:disable Metrics/MethodLength
    puts 'Mastermind Game'
    puts '1 => 🔵 | 2 => 🔴 | 3 => 🟢 | 4 => 🟠 | 5 => 🟣 | 6 => 🟡'
    rows.each_with_index do |row, index|
      if index == 10
        print '→ '
      else
        print '  '
      end
      print (index + 1).to_s.rjust(2)
      print ' || '
      row.pegs.each do |peg|
        print peg
      end
      puts
    end
  end
end
