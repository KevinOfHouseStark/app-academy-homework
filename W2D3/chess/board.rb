require_relative "piece"
require_relative "rook"
require_relative "bishop"
require_relative "queen"
require_relative "knight"
require_relative "king"
require_relative "pawn"
require_relative "null"
require "byebug"

class Board
    attr_reader :grid
  
    def initialize
        @grid = Array.new(8) {Array.new(8)}
    end

    def [](pos)
        col, row = interpret_pos(pos)

        @grid[col][row]
    end

    def []=(pos, val)
        col, row = interpret_pos(pos)

        @grid[col][row] = val
    end

    def populate_board
        cols = ("A".."H").to_a
        rows = ("1".."8").to_a

        rows.each do |row|
            if row == "1"
                #populates white's back rank
                cols.each do |col|
                    pos = col + row
                    if col == "A" || col == "H"
                        self[pos] = Rook.new(:white, self, interpret_pos(pos))
                    elsif col == "B" || col == "G"
                        self[pos] = Knight.new(:white, self, interpret_pos(pos))
                    elsif col == "C" || col == "F"
                        self[pos] = Bishop.new(:white, self, interpret_pos(pos))
                    elsif col == "D"
                        self[pos] = Queen.new(:white, self, interpret_pos(pos))
                    elsif col == "E"
                        self[pos] = King.new(:white, self, interpret_pos(pos))
                    end
                end
            elsif row == "8"
                #populates black's back rank
                cols.each do |col|
                    pos = col + row
                    if col == "A" || col == "H"
                        self[pos] = Rook.new(:black, self, interpret_pos(pos))
                    elsif col == "B" || col == "G"
                        self[pos] = Knight.new(:black, self, interpret_pos(pos))
                    elsif col == "C" || col == "F"
                        self[pos] = Bishop.new(:black, self, interpret_pos(pos))
                    elsif col == "D"
                        self[pos] = Queen.new(:black, self, interpret_pos(pos))
                    elsif col == "E"
                        self[pos] = King.new(:black, self, interpret_pos(pos))
                    end
                end
            elsif row == "2"
                #populates white's pawn rank
                cols.each do |col|
                    pos = col + row
                    self[pos] = Pawn.new(:white, self, interpret_pos(pos))
                end
            elsif row == "7"
                #populates black's pawn rank
                cols.each do |col|
                    pos = col + row
                    self[pos] = Pawn.new(:black, self, interpret_pos(pos))
                end
            else
                #populates null pieces
                cols.each do |col|
                    pos = col + row
                    self[pos] = NullPiece.instance
                end
            end
        end
    end

    def interpret_pos(pos)
        new_pos = pos.to_s.split("").to_a
        letters = Hash.new(0)

        col = 0
        ("A".."H").to_a.each do |letter|
            letters[letter] = col
            col += 1
        end

        return [letters[new_pos[0]], new_pos[1].to_i - 1]
    end

    def move_piece(color, start_pos, end_pos)

    end

    def valid_pos?(pos)
        
    end

    def add_piece(piece, pos)

    end

    def checkmate?(color)

    end

    def in_check?(color)

    end

    def find_king(color)

    end

    def pieces

    end
    
    def dup

    end

    def move_piece!(color, start_pos, end_pos)
        
    end
end