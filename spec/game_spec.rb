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
    end

    it 'allows adding Xs' do
      expect(@new_game.play(1, "X"))
      expect(@new_game.moves[0]).to eq "X"
    end

    it 'allows adding Os' do
      expect(@new_game.play(1, "O"))
      expect(@new_game.moves[0]).to eq "O"
    end

    it 'does not allow adding anything other than Xs and Os' do
      expect {@new_game.play(1, "invalid")}.to raise_error
    end

    it 'does not allow playing to an invalid spot' do
      expect { @new_game.play(10, "X") }.to raise_error
    end

    it 'congratulates winner if game is over' do
      player = instance_double("Player")
      allow(@new_game).to receive(:winner).and_return(player)
      expect { @new_game.play(5, "X") }.to output(/Congratulations/).to_stdout
    end

    it 'does not congratulate winner if there is no winner' do
      allow(@new_game).to receive(:winner).and_return(nil)
      expect { @new_game.play(5, "X") }.not_to output(/Congratulations/).to_stdout
    end
  end
end