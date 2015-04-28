class Board

  attr_reader :cells

  def initialize(content = Cell)
    @cells = {}
    [*1..9].each { |ref| @cells[ref] = content.new}
  end

end
