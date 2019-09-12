require_relative "piece"
require_relative "slideable"

class Rook < Piece
    include Slideable
    
    def symbol
        if self.color == :white
            return '♖'
        elsif self.color == :black
            return '♜'
        end
    end

    protected
    def move_dirs
        self.horizontal_dirs
    end
end