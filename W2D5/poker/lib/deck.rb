require_relative "card"
require "byebug"

class Deck
    def initialize
       @cards = Card.suits.product(Card.values).map {|suit, value| Card.new(suit, value)}
    end

    def shuffle!
        @cards.shuffle!
    end

    def take(n)
        if n > @cards.length
            raise ArgumentError.new("Trying to take too many cards!")
        end
        taken = []
        n.times { taken << @cards.shift }
        taken
    end
end