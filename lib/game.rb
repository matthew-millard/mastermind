# frozen_string_literal: true

require_relative 'board'
require_relative 'code_maker'

# Game class
class Game
  attr_reader :secret_code
  attr_accessor :board

  def initialize
    @board = Board.new
    @secret_code = CodeMaker.new.secret_code
  end
end
