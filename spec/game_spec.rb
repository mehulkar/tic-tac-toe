require 'spec_helper'
require File.join(File.dirname(__FILE__), '../lib/game.rb')

describe Game do

  let(:x_player) { instance_double("Player", sign: "X") }
  let(:o_player) { instance_double("Player", sign: "O") }

  let(:new_game) do
    described_class.new(x_player, o_player)
  end

  describe 'initialize' do
    it 'should print a greeting to console' do
      expect { described_class.new(x_player, o_player) }.to output(/Welcome/).to_stdout
    end
  end

  describe '#first_player' do
    it 'returns the first player from game initialize'do
      a_game = described_class.new(x_player, o_player)
      expect( a_game.first_player ).to eq x_player
    end
  end

  describe '#second_player' do
    it 'returns the second player from game initialize' do
      a_game = described_class.new(x_player, o_player)
      expect( a_game.second_player ).to eq o_player
    end
  end

  describe '#moves' do
    it 'should initialize an array of nine elements' do
      expect(new_game.moves.length).to eq 9
    end
  end

  describe '#play' do
    before(:each) do
      new_game = described_class.new(x_player, o_player)
    end

    it 'adds the first player\'s sign on odd moves' do
      new_game.play(1)
      expect(new_game.moves[0]).to eq new_game.first_player.sign
    end

    it 'adds the second player\'s sign on even moves' do
      new_game.play(1)
      new_game.play(5)
      expect(new_game.moves[4]).to eq new_game.second_player.sign
    end

    it 'does not allow playing to an invalid spot' do
      expect { new_game.play(10) }.to raise_error
    end

    it 'congratulates winner if game is over' do
      allow(new_game).to receive(:winner).and_return(x_player)
      expect { new_game.play(5) }.to output(/Congratulations/).to_stdout
    end

    it 'does not congratulate winner if there is no winner' do
      allow(new_game).to receive(:winner).and_return(nil)
      expect { new_game.play(5) }.not_to output(/Congratulations/).to_stdout
    end
  end
end