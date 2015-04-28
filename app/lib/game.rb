require_relative 'board'
# require 'cell'

class Game

  attr_reader :board, :turn

  def initialize(content = Board)
    @board = content.new
    @turn = :computer
    @rows = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  end

  def swap_turn
    @turn = @turn == :computer ? :human : :computer
  end

  def winner
    @rows.each do |row|
      return 'Computer Wins' if row.select { |cell| board[cell] == :x }.length == 3
      return 'Human Wins' if row.select { |cell| board[cell] == :o }.length == 3
    end
    return false
  end

end
