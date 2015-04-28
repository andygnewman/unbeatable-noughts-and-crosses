require_relative '../lib/computer.rb'

describe Computer do

  let(:computer) {Computer.new}
  let(:board_start) {{1 => :a, 2 => :a, 3 => :a, 4 => :a, 5 => :a, 6 => :a, 7 => :a, 8 => :a, 9 => :a}}
  let(:board_second_two) {{1 => :a, 2 => :o, 3 => :a, 4 => :a, 5 => :x, 6 => :a, 7 => :a, 8 => :a, 9 => :a}}
  let(:board_human_two_row) {{1 => :x, 2 => :o, 3 => :o, 4 => :a, 5 => :x, 6 => :a, 7 => :x, 8 => :a, 9 => :o}}
  let(:board_computer_two_row) {{1 => :x, 2 => :x, 3 => :o, 4 => :o, 5 => :x, 6 => :a, 7 => :a, 8 => :o, 9 => :a}}

  context 'choosing its moves:' do

    context 'first move' do

      it 'should choose the centre when going first' do
        expect(computer.first_move).to eq(5)
      end

    end

    context 'second move' do

      it 'should know how many turns have taken place' do
        expect(computer.how_many_turns(board_second_two)).to eq(2)
      end

      it 'should know the human first move when evaluating second move' do
        expect(computer.human_first_turn(board_second_two)).to eq(2)
      end

      it 'should choose 9 if human chooses 2 or 4 on their first turn' do
        expect(computer.second_turn(2)).to eq(9)
        expect(computer.second_turn(4)).to eq(9)
      end

      it 'should choose 1 if human chooses 3, 6, 7 or 8' do
        expect(computer.second_turn(3)).to eq(1)
        expect(computer.second_turn(6)).to eq(1)
        expect(computer.second_turn(7)).to eq(1)
        expect(computer.second_turn(8)).to eq(1)
      end

      it 'should choose 7 if human chooses 1 or 9' do
        expect(computer.second_turn(1)).to eq(7)
        expect(computer.second_turn(9)).to eq(7)
      end

    end

    context 'third move and onwards' do

      it 'should fill a row where there are two computer tokens already' do
        expect(computer.computer_win(board_computer_two_row)).to eq(9)
      end

      it 'should block a row where there are two human tokens already' do
        expect(computer.block_human(board_human_two_row)).to eq(6)
      end

      it 'should pick the first available cell if no win or block available' do
        expect(computer.first_available(board_computer_two_row)).to eq(6)
      end

    end

  end

end
