require_relative "piece"
require_relative "slideable"

class Queen < Piece
    include Slideable
    
    def symbol
        if self.color == :white
            return '♕'
        elsif self.color == :black
            return '♛'
        end
    end

    protected
    def move_dirs
        diagonal_dirs + horizontal_dirs 
    end
end