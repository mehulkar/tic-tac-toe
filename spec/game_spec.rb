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
end