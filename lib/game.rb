class Game

  attr_reader :board, :turn

  def initialize(content = Board)
    @board = content.new
    @turn = :computer
  end

  def swap_turn
    @turn = @turn == :computer ? :human : :computer
  end

end
