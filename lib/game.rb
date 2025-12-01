# frozen_string_literal: true

require_relative 'board'
require_relative 'peg'

class Game
  COLORS = %w[Red Yellow Purple Green Orange Blue].freeze
  MAX_TURNS = 12

  attr_accessor :board, :secret_code, :current_turn

  def initialize
    @board = Board.new
    @secret_code = generate_secret_code
    @current_turn = 0
  end

  def start
    display_welcome
    game_loop
  end

  private

  def generate_secret_code
    Array.new(4) { COLORS.sample }
  end

  def display_welcome
    puts "\n╔═══════════════════════════════════════════════════════════╗"
    puts '║              Welcome to MASTERMIND!                      ║'
    puts '╠═══════════════════════════════════════════════════════════╣'
    puts '║ Guess the secret code of 4 colors!                       ║'
    puts '║ Available colors: Red, Yellow, Purple, Green, Orange, Blue ║'
    puts '║ Enter 4 colors separated by spaces (e.g., Red Blue Green Yellow) ║'
    puts '╚═══════════════════════════════════════════════════════════╝'
    puts ''
  end

  def game_loop
    while @current_turn < MAX_TURNS
      @current_turn += 1
      puts "\n--- Turn #{@current_turn} of #{MAX_TURNS} ---"

      guess = get_player_guess
      return if guess.nil? # Player quit

      set_guess(@current_turn - 1, guess)
      feedback = calculate_feedback(guess)
      set_feedback(@current_turn - 1, feedback)

      board.display

      if won?(feedback)
        display_win_message
        return
      end
    end

    display_lose_message
  end

  def get_player_guess
    print 'Enter your guess (or "quit" to exit): '
    input = gets.chomp.strip

    return nil if input.downcase == 'quit'

    colors = input.split.map(&:capitalize)

    unless valid_guess?(colors)
      puts "Invalid input! Please enter 4 valid colors from: #{COLORS.join(', ')}"
      return get_player_guess
    end

    colors
  end

  def valid_guess?(colors)
    return false unless colors.length == 4

    colors.all? { |color| COLORS.include?(color) }
  end

  def set_guess(turn_index, colors)
    row = board.rows[turn_index]
    colors.each_with_index do |color, index|
      row.pegs[index].color = color
    end
  end

  def calculate_feedback(guess)
    # Create copies to avoid modifying originals
    secret = secret_code.dup
    guess_copy = guess.dup
    feedback = []

    # First pass: find exact matches (black pegs)
    guess_copy.each_with_index do |color, index|
      next unless secret[index] == color

      feedback << Peg.new('Black')
      secret[index] = nil
      guess_copy[index] = nil
    end

    # Second pass: find color matches in wrong position (white pegs)
    guess_copy.each_with_index do |color, _index|
      next if color.nil?

      secret.each_with_index do |secret_color, secret_index|
        next unless secret_color == color

        feedback << Peg.new('White')
        secret[secret_index] = nil
        break
      end
    end

    feedback
  end

  def set_feedback(turn_index, feedback_pegs)
    board.rows[turn_index].feedback_pegs = feedback_pegs
  end

  def won?(feedback)
    feedback.length == 4 && feedback.all? { |peg| peg.color == 'Black' }
  end

  def display_win_message
    puts "\n╔═══════════════════════════════════════════════════════════╗"
    puts '║                    🎉 YOU WIN! 🎉                        ║'
    puts "║         You cracked the code in #{@current_turn} turn#{@current_turn == 1 ? '' : 's'}!              ║"
    puts '║              The secret code was:                         ║'
    print '║              '
    secret_code.each { |color| print "#{Peg.new(color)} " }
    puts '                              ║'
    puts '╚═══════════════════════════════════════════════════════════╝'
  end

  def display_lose_message
    puts "\n╔═══════════════════════════════════════════════════════════╗"
    puts '║                    😞 GAME OVER 😞                        ║'
    puts '║              You ran out of turns!                        ║'
    puts '║              The secret code was:                          ║'
    print '║              '
    secret_code.each { |color| print "#{Peg.new(color)} " }
    puts '                              ║'
    puts '╚═══════════════════════════════════════════════════════════╝'
  end
end
