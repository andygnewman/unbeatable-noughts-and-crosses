class Cell

  attr_reader :status

  def initialize
    @status = :a
  end

  def play(symbol)
    @status = symbol
  end

end
