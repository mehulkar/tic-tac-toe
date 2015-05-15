require 'spec_helper'

describe Player do
  it 'can have a sign X' do
    x_player = Player.new(sign: 'X')
    expect(x_player.sign).to eq 'X'
  end

  it 'can have a sign O' do
    o_player = Player.new(sign: 'O')
    expect(x_player.sign).to eq 'O'
  end

  it 'cannot have any other signs' do
    expect(Player.new(sign: 'invalid')).to raise_error
  end
end