require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over?
      return board.winner != evaluator && board.won?
    end

    if @next_mover_mark == evaluator
      self.children.all? {|child| child.losing_node?(evaluator)}
    elsif @next_move_mark != evaluator
      self.children.any? {|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if board.over?
      return board.winner == evaluator && board.won?
    end

    if @next_mover_mark == evaluator
      self.children.any? {|child| child.winning_node?(evaluator)}
    elsif @next_mover_mark != evaluator
      self.children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    nodes = []

    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        next if !@board.empty?(pos)

        duped_board = @board.dup
        duped_board[pos] = @next_mover_mark
        new_node = TicTacToeNode.new(duped_board, self.alternate_mover_mark, pos)
        nodes << new_node
      end
    end

    nodes
  end

  def alternate_mover_mark
    if @next_mover_mark == :x
      return :o
    elsif @next_mover_mark == :o
      return :x
    end
  end
end
