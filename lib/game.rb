require_relative 'board'

class Game
  MAX_ATTEMPTS = 12
  attr_accessor :board, :current_turn

  def initialize
    @board = Board.new(MAX_ATTEMPTS)
    @current_turn = 0
  end

  def start
    board.display
  end
end
