require_relative "piece"
require "byebug"

class Pawn < Piece
    POSSIBLE_MOVES = [

    ]
    
    def symbol
        if self.color == :white
            return '♙'
        elsif self.color == :black
            return '♟'
        end
    end

    def moves
        forward_steps + side_attacks
    end

    private
    def at_start_row?
        if self.color == :white
            return pos[1] == 2
        elsif self.color == :black
            return pos[1] == 7
        end
    end

    def forward_dir
        if self.color == :white
            return 1
        elsif self.color == :black
            return -1
        end
    end

    def forward_steps
        col, row = pos

        steps = []
        step = [col, row + forward_dir]
        steps << step if board.valid_pos?(step) && board[step] == NullPiece.instance

        double_step = [col, row + (forward_dir * 2)]
        steps << double_step if board.valid_pos?(step) && board[step] == NullPiece.instance && board[double_step] == NullPiece.instance && at_start_row?
        
        steps
    end

    def side_attacks
        col, row = pos

        possible_attacks = [[col - 1, row + forward_dir], [col + 1, row + forward_dir]]

        possible_attacks.select do |next_pos|
            if !board.valid_pos?(next_pos) || board[next_pos] == NullPiece.instance
                next false
            end

            board[next_pos].color != self.color
        end
    end
end