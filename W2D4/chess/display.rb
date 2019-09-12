require_relative "cursor"
require_relative "board"

class Display
    attr_reader :board

    def initialize(board)
        @board = board
    end

    def render
        puts "  --------------------------------"
        cols = ("A".."H").to_a
        rows = ("1".."8").to_a

        rows.reverse_each do |row|
            print row
            cols.each do |col|
                pos = col + row
                print "| " + board[pos].symbol + " "
            end
            print "|"
            puts "\n  --------------------------------"
        end
        puts "   A   B   C   D   E   F   G   H"
    end
end