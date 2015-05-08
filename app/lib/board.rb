require_relative 'cell'

# Data structure should be hidden
class Board

  attr_reader :cells

  def initialize(content = Cell)
    @cells = {}
    [*1..9].each { |ref| @cells[ref] = content.new}
  end

  def play(cell, symbol)
    cells[cell].play(symbol)
  end

  # remove call to each / use Enumerable
  def get_board
    board_hash = {}
    @cells.each { | ref, cell | board_hash[ref] = cell.status }
    return board_hash
  end

  # remove call to each / use Enumerable
  def get_empty_cells_array
    empty_cells = []
    @cells.each { | ref, cell | empty_cells << ref if cell.status == :a}
    return empty_cells
  end

end
