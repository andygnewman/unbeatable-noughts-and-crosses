require_relative '../lib/game.rb'

describe Game do

  let(:game) {Game.new(board_class)}
  let(:board_class) {double :board_class, new: board}
  let(:board) {double :board}
  let(:comp_winning_board) {{1 => :x, 2 => :a, 3 => :o, 4 => :o, 5 => :x, 6 => :a, 7 => :a, 8 => :a, 9 => :x}}
  let(:human_winning_board) {{1 => :x, 2 => :a, 3 => :o, 4 => :a, 5 => :x, 6 => :o, 7 => :x, 8 => :a, 9 => :o}}
  let(:no_winning_board) {{1 => :x, 2 => :a, 3 => :o, 4 => :a, 5 => :x, 6 => :a, 7 => :x, 8 => :a, 9 => :o}}

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

    context 'evaluating a winner:' do

      it 'should announce the computer wins with 3 in a row' do
        allow(game).to receive(:board).and_return(comp_winning_board)
        expect(game.winner).to eq('Computer Wins')
      end

      it 'should announce the human wins with 3 in a row - never happen!' do
        allow(game).to receive(:board).and_return(human_winning_board)
        expect(game.winner).to eq('Human Wins')
      end

      it 'should return false if no winner' do
        allow(game).to receive(:board).and_return(no_winning_board)
        expect(game.winner).to be(false)
      end

    end

  end

end
