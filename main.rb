# frozen_string_literal: true

require_relative 'lib/game'

game = Game.new

game.board.display

# Start game.
# A secret code has been generated.
# A board is initialized, displaying 12 empty rows

# Check to see if the attempt count is less than or equal to attempt limit. If not, display loser message and exit game.

# Code breaker is asked to guess the secret code
# The code is compared to the secret code in two ways:
# The first - does this color exist in the secret code?
# The second - is this color in the same place as the matching color in the secret code?
# Check whether the code has been broken? If so, display congratulation message and exit game.
# Display the results to the code breaker.
# Increase attempt count.
# Move onto the next attempt.
