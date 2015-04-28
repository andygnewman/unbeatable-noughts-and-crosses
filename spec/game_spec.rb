require_relative '../lib/game.rb'

describe Game do

  let(:game) {Game.new(board_class)}
  let(:board_class) {double :board_class, new: board}
  let(:board) {double :board}

  context 'a game when initialized:' do

    it 'should initiate a board' do
      expect(game.board).to_not be(nil)
    end

    it 'should know that the computer goes first' do
      expect(game.turn).to eq(:computer)
    end

  end

  context 'playing the game:' do

    it 'should swap turns between the computer and human' do
      game.swap_turn
      expect(game.turn).to eq(:human)
    end

  end

end
