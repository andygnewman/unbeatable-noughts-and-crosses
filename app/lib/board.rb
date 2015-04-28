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
    @cells.each { | ref, cell | board_hash[ref] = cell.status }
    return board_hash
  end

  def get_empty_cells
    empty_cells = []
    @cells.each { | ref, cell | empty_cells << ref if cell.status == :a}
    return empty_cells
  end
  
end
