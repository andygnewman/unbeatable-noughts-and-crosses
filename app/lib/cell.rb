class Cell

  attr_reader :status

  def initialize
    @status = :a
  end

  def play(symbol)
    raise 'This cell has already been played' if not_available?
    @status = symbol
  end

  def not_available?
    @status != :a
  end

end
