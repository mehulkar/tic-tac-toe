class Game
  attr_accessor :moves, :first_player, :second_player

  WINNING_PATTERNS = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7],
  ]

  def initialize(player1, player2)
    puts "Welcome to Tic Tac Toe!"
    @moves = Array.new(9)
    @first_player = player1
    @second_player = player2
  end

  def play(spot)
    raise StandardError if invalid_spot?(spot)
    @moves[spot - 1] = current_player.sign
    puts "Congratulations" if winner
  end

  def winner
  end
private

  def current_player
    to_ret = if @moves.compact.length.even?
      @first_player
    else
      @second_player
    end

    return to_ret
  end

  def invalid_spot?(spot)
    spot < 1 || spot > @moves.length
  end
end