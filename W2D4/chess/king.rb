require_relative "piece"
require_relative "stepable"

class King < Piece
    include Stepable

    POSSIBLE_MOVES = [
        [1,1],
        [1,0],
        [0,1],
        [-1,-1],
        [-1,0],
        [0,-1],
        [1,-1],
        [-1,1]
    ]

    def symbol
        if self.color == :white
            return '♔'
        elsif self.color == :black
            return '♚'
        end
    end

    def move_diffs
        return POSSIBLE_MOVES
    end
end