# frozen_string_literal: true

require_relative 'board'
require_relative 'code_maker'

# Game class
class Game
  attr_reader :secret_code

  def initialize
    @board = Board.new
    @secret_code = CodeMaker.new.secret_code
  end

  def play
    puts 'Let\'s play!'
  end
end
