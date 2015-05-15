require 'spec_helper'

describe TicTacToe do
  it 'initializes a new game on start ' do
    expect(TicTacToe.start).to be_an_instance_of Game
  end
end