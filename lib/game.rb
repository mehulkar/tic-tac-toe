class Game
  attr_accessor :moves, :first_player, :second_player

  def initialize(player1, player2)
    puts "Welcome to Tic Tac Toe!"
    @moves = Array.new(9)
    @first_player = player1
    @second_player = player2
  end

  def play(spot)
    raise StandardError if invalid_spot?(spot)
    @moves[spot - 1] = player.sign
    puts "Congratulations" if winner
  end

  def winner
  end
private
  def invalid_spot?(spot)
    spot < 1 || spot > @moves.length
  end
end