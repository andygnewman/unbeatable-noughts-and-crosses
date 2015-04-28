require_relative 'cell'

class Board

  attr_reader :cells

  def initialize(content = Cell)
    @cells = {}
    [*1..9].each { |ref| @cells[ref] = content.new}
  end

  def play(cell, symbol)
    cells[cell].play(symbol)
  end

  def get_board
    board_hash = {}
    @cells.each { | grid_ref, cell | board_hash[grid_ref] = cell.status }
    return board_hash
  end

end
