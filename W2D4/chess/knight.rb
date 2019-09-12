require_relative "piece"
require_relative "stepable"

class Knight < Piece
    include Stepable
    
    POSSIBLE_MOVES = [
        [1, 2],
        [1, -2],
        [-1, 2],
        [-1, -2],
        [2, 1],
        [2, -1],
        [-2, 1],
        [-2, -1],
    ]
    
    def symbol
        if self.color == :white
            return '♘'
        elsif self.color == :black
            return '♞'
        end
    end

    def move_diffs
        return POSSIBLE_MOVES
    end

    def valid_move?(start_pos, end_pos)
        POSSIBLE_MOVES.any? {|dx, dy| end_pos == [start_pos[0] + dx, start_pos[1] + dy]}
    end
end