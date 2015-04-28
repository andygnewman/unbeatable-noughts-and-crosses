require_relative '../lib/board.rb'

describe Board do

  context 'a board when initialized:' do

    it 'should have 9 cells' do
      board = Board.new
      expect(board.cells.count).to eq(9)
    end

  end

end
