require_relative '../app/lib/cell.rb'

describe Cell do

  let(:cell){Cell.new}

  context 'a cell when initialized should:' do

    it 'should have a status of available' do
      expect(cell.status).to eq(:available)
    end

  end

  context 'during the game:' do

    it 'should be able to change status if currently available and played' do
      cell.play(:x)
      expect(cell.status).to eq(:x)
    end

    it 'should raise an error if a previously played cell is played again' do
      cell.play(:x)
      expect{cell.play(:o)}.to raise_error(RuntimeError, 'This cell has already been played')
    end

  end

end
