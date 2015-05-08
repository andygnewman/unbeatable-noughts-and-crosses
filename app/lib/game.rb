require_relative 'board'
require_relative 'computer'

# Think about encapsulation
#
# First player should be X
class Game

  attr_reader :board, :computer, :turn

  def initialize(board = Board, computer = Computer)
    @board = board.new
    @computer = computer.new
    @turn = :computer
    @rows = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  end

  # does two things - who is the winner vs is there a winner? vs is the game over?
  # UI logic shouldn't be here
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

  def empty_cells_array
    board.get_empty_cells_array
  end

  def empty_cells_number
    empty_cells_array.length
  end

  # Specs should fail

  def computer_turn
    board.play(computer.choice(current_board), :x)
  end

  def human_turn(cell)
    board.play(cell.to_i, :o)
  end

  def draw?
    empty_cells_number == 0
  end

end
