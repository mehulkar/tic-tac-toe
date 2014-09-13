class Game
  attr_accessor :moves

  def initialize
    puts "Welcome to Tic Tac Toe!"
    @moves = Array.new(9)
  end

  def play(spot, player)
    raise StandardError if invalid_move?(player.sign, spot)
    @moves[spot - 1] = player.sign
    puts "Congratulations" if winner
  end

  def winner
  end

private

  def invalid_move?(sign, spot)
    invalid_sign?(sign) || invalid_spot?(spot)
  end

  def invalid_sign?(sign)
    !["X", "O"].include? sign
  end

  def invalid_spot?(spot)
    spot < 1 || spot > @moves.length
  end
end