require_relative 'board'
require_relative 'computer'

class Game

  attr_reader :board, :computer, :turn

  def initialize(board = Board, computer = Computer)
    @board = board.new
    @computer = computer.new
    @turn = :computer
    @rows = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  end

  def winner
    @rows.each do |row|
      return 'Computer Wins' if row.select { |cell| current_board[cell] == :x }.length == 3
      return 'Human Wins' if row.select { |cell| current_board[cell] == :o }.length == 3
    end
    return 'Stalemate - a draw' if draw?
    return false
  end

  def current_board
    board.get_board
  end

  def computer_turn
    board.play(computer.choice(current_board), :x)
  end

  def empty_cells
    board.get_empty_cells
  end

  def human_turn(cell)
    board.play(cell.to_i, :o)
  end

  def draw?
    empty_cells == 0
  end

end
