require_relative "piece"
require "singleton"

class NullPiece < Piece
    include Singleton
    
    def initialize
        @color = :none
    end

    def moves
        []
    end

    def empty?
        true
    end

    def symbol
        return ' '
    end
end