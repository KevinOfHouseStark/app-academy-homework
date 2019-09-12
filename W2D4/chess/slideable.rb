module Slideable
    HORIZONTAL_DIRS = [
        [0,1],
        [1,0],
        [0,-1],
        [-1,0]
    ]
    DIAGONAL_DIRS = [
        [1,1],
        [-1,1],
        [1,-1],
        [-1,-1]
    ]

    def horizontal_dirs
        return HORIZONTAL_DIRS
    end

    def diagonal_dirs
        return DIAGONAL_DIRS
    end

    def moves
        debugger
        all_possible_moves = []

        move_dirs.each {|dx, dy| all_possible_moves += grow_unblocked_moves_in_dir(dx, dy)}

        all_possible_moves
    end

    private
    def moves_dirs

    end

    def grow_unblocked_moves_in_dir(dx, dy)
        moves = []
        x, y = pos

        debugger

        while true
            x += dx
            y += dy
            pos = [x, y]

            break if !board.valid_pos?(pos)

            if board[pos] == NullPiece.instance
                moves << pos
            elsif board[pos].color != self.color
                moves << pos
                break
            end
        end

        moves
    end
end