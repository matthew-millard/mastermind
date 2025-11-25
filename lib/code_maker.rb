# frozen_string_literal: true

# code maker class
class CodeMaker
  attr_reader :secret_code

  def initialize
    @secret_code = generate_code
  end

  def generate_code
    %w[Green Yellow Red Pink]
  end
end
