class Game
  attr_accessor :moves

  def initialize
    puts "Welcome to Tic Tac Toe!"
    @moves = Array.new(9)
  end

  def play(spot, sign)
    raise StandardError if !["X", "O"].include? sign
    raise StandardError if (spot < 1 || spot > @moves.length)
    @moves[spot - 1] = sign
  end
end