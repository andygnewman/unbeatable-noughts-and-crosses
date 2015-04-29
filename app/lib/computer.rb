class Computer

  def initialize
    @best_third_move = {1 => [3,6,7,8], 7 => [1,9], 9 => [2,4]}
    @rows = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  end

  def choice(board)
    case how_many_turns(board)
    when 0; first_move
    when 1; second_move(human_first_move(board))
    when 2; third_move(human_first_move(board))
    else best_possible(board)
    end
  end

  def how_many_turns(board)
    board.values.reject { |v| v == :a }.length
  end

  def human_first_move(board)
    board.key(:o)
  end

  def first_move
    5
  end

  def second_move(human_move)
    human_move == 5 ? 1 : 5
  end

  def third_move(human_move)
    @best_third_move.select { |k, v| v.include?(human_move) }.keys.first
  end

  def best_possible(board)
    return computer_win(board) unless computer_win(board) == false
    return block_human(board) unless block_human(board) == false
    return first_available(board)
  end

  def computer_win(board)
    block_or_win(:x, :o, board)
  end

  def block_human(board)
    block_or_win(:o, :x, board)
  end

  def block_or_win(two_symbol, one_symbol, board)
    @rows.each do |row|
      if (row.select { |cell| board[cell] == two_symbol }.length == 2 &&
        row.any? { |cell| board[cell] == one_symbol } == false)
        return row.select { |cell| board[cell] == :a }.first
      end
    end
    return false
  end

  def first_available(board)
    board.each { |k, v| return k if v == :a }
  end

end
