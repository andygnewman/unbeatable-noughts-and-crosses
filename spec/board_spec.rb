require_relative '../lib/board.rb'

describe Board do

  let(:board) {Board.new(cell_class)}
  let(:cell_class) {double :cell_class, new: cell}
  let(:cell) {double :cell}

  context 'a board when initialized:' do

    it 'should have 9 cells' do
      # board = Board.new(Cell)
      expect(board.cells.length).to eq(9)
    end

  end

  context 'playing the game:' do

    it 'should play a specific cell' do
      # board = Board.new(Cell)
      expect(board.cells[1]).to receive(:play).with(:x)
      board.play(1, :x)
    end

  end

end
