require 'spec_helper'
require File.join(File.dirname(__FILE__), '../lib/game.rb')

describe Game do
  describe 'initialize' do

    it 'should print a greeting to console' do
      expect { described_class.new }.to output(/Welcome/).to_stdout
    end
  end
  describe '#moves' do
    before(:each) do
      @new_game = described_class.new
    end

    it 'should initialize an array of nine elements' do
      expect(@new_game.moves.length).to eq 9
    end
  end

  describe '#play' do
    before(:each) do
      @new_game = described_class.new
      @x_player = instance_double("Player", sign: "X")
      @o_player = instance_double("Player", sign: "O")
    end

    it 'allows adding Xs' do
      expect(@new_game.play(1, @x_player))
      expect(@new_game.moves[0]).to eq "X"
    end

    it 'allows adding Os' do
      expect(@new_game.play(1, @o_player))
      expect(@new_game.moves[0]).to eq "O"
    end

    it 'does not allow adding anything other than Xs and Os' do
      player_with_invalid_move = instance_double("Player", sign: "invalid")
      expect {@new_game.play(1, player_with_invalid_move)}.to raise_error
    end

    it 'does not allow playing to an invalid spot' do
      expect { @new_game.play(10, @x_player) }.to raise_error
    end

    it 'congratulates winner if game is over' do
      allow(@new_game).to receive(:winner).and_return(@x_player)
      expect { @new_game.play(5, @x_player) }.to output(/Congratulations/).to_stdout
    end

    it 'does not congratulate winner if there is no winner' do
      allow(@new_game).to receive(:winner).and_return(nil)
      expect { @new_game.play(5, @x_player) }.not_to output(/Congratulations/).to_stdout
    end
  end
end