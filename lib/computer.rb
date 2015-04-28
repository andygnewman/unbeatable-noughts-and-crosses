class Computer

  def initialize
    @best_second_turn = {1 => [3,6,7,8], 7 => [1,9], 9 => [2,4]}
  end

  def choice(board)
    case how_many_turns(board)
    when 0
      5
    when 2
      second_turn(human_first_turn(board))
    else
      best_possible
    end
  end

  def how_many_turns(board)
    board.values.reject { |v| v == :a }.length
  end

  def human_first_turn(board)
    board.key(:o)
  end

  def second_turn(human_play)
    @best_second_turn.select { |k, v| v.include?(human_play) }.keys.first
  end

end
