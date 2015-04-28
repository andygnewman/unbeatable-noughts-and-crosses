require_relative '../lib/cell.rb'

describe Cell do

  context 'a cell when initialized should:' do

    let(:cell){Cell.new(1)}

    it 'should have a reference' do
      expect(cell.ref).to eq(1)
    end

    it 'should have a status of available' do
      expect(cell.status).to eq(:available)
    end

  end

end
