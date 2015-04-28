require_relative '../app/lib/board.rb'

describe Board do

  let(:board) {Board.new(cell_class)}
  let(:cell_class) {double :cell_class, new: cell}
  let(:cell) {double :cell, status: :a}

  context 'a board when initialized:' do

    it 'should have 9 cells' do
      expect(board.cells.length).to eq(9)
    end

  end

  context 'playing the game:' do

    it 'should play a specific cell' do
      expect(board.cells[1]).to receive(:play).with(:x)
      board.play(1, :x)
    end

    it 'should create a summarised grid' do
      summary_board = {1 => :a, 2 => :a, 3 => :a, 4 => :a, 5 => :a, 6 => :a, 7 => :a, 8 => :a, 9 => :a}
      expect(board.get_board).to eq(summary_board)
    end

    it 'should return an array of empty cells' do
      expect(board.get_empty_cells).to eq([1 ,2 ,3 ,4 ,5 ,6 ,7 , 8, 9])
    end

  end

end
