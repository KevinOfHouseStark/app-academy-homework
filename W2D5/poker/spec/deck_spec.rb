require "rspec"
require "deck"

describe Deck do
    let(:cards) do
        [   double("card", :suit => :spades, :value => :deuce),
            double("card", :suit => :spades, :value => :three),
            double("card", :suit => :spades, :value => :four),
            double("card", :suit => :spades, :value => :five),
            double("card", :suit => :spades, :value => :six),
            double("card", :suit => :spades, :value => :seven),
            double("card", :suit => :spades, :value => :eight),
            double("card", :suit => :spades, :value => :nine),
            double("card", :suit => :spades, :value => :ten),
            double("card", :suit => :spades, :value => :jack),
            double("card", :suit => :spades, :value => :queen),
            double("card", :suit => :spades, :value => :king),
            double("card", :suit => :spades, :value => :ace),
            double("card", :suit => :hearts, :value => :deuce),
            double("card", :suit => :hearts, :value => :three),
            double("card", :suit => :hearts, :value => :four),
            double("card", :suit => :hearts, :value => :five),
            double("card", :suit => :hearts, :value => :six),
            double("card", :suit => :hearts, :value => :seven),
            double("card", :suit => :hearts, :value => :eight),
            double("card", :suit => :hearts, :value => :nine),
            double("card", :suit => :hearts, :value => :ten),
            double("card", :suit => :hearts, :value => :jack),
            double("card", :suit => :hearts, :value => :queen),
            double("card", :suit => :hearts, :value => :king), 
            double("card", :suit => :hearts, :value => :ace),          
            double("card", :suit => :diamonds, :value => :deuce),
            double("card", :suit => :diamonds, :value => :three),
            double("card", :suit => :diamonds, :value => :four),
            double("card", :suit => :diamonds, :value => :five),
            double("card", :suit => :diamonds, :value => :six),
            double("card", :suit => :diamonds, :value => :seven),
            double("card", :suit => :diamonds, :value => :eight),
            double("card", :suit => :diamonds, :value => :nine),
            double("card", :suit => :diamonds, :value => :ten),
            double("card", :suit => :diamonds, :value => :jack),
            double("card", :suit => :diamonds, :value => :queen),
            double("card", :suit => :diamonds, :value => :king), 
            double("card", :suit => :diamonds, :value => :ace),          
            double("card", :suit => :clubs, :value => :deuce),
            double("card", :suit => :clubs, :value => :three),
            double("card", :suit => :clubs, :value => :four),
            double("card", :suit => :clubs, :value => :five),
            double("card", :suit => :clubs, :value => :six),
            double("card", :suit => :clubs, :value => :seven),
            double("card", :suit => :clubs, :value => :eight),
            double("card", :suit => :clubs, :value => :nine),
            double("card", :suit => :clubs, :value => :ten),
            double("card", :suit => :clubs, :value => :jack),
            double("card", :suit => :clubs, :value => :queen),
            double("card", :suit => :clubs, :value => :king),
            double("card", :suit => :clubs, :value => :ace), ]
    end

    describe "#initialize" do
        subject(:deck) {Deck.new}
        it "should generate a full deck of 52 cards" do
            expect(deck.instance_variable_get(:@cards).length).to eq(52)
        end

        it "should possess all combinations of suit-value pairs" do
            cards.each do |card|
                expect(deck.instance_variable_get(:@cards).include?(card)).to eq true
            end
        end

        it "should possess only unique suit-value pairs" do
            duped_cards = deck.instance_variable_get(:@cards)
                .map {|card| [card.suit, card.value]}
                .uniq
            expect(duped_cards.count).to eq(52)
        end
    end

    describe "#shuffle" do
        subject(:deck) {Deck.new}
        it "should shuffle the cards" do
            duped_cards = deck.instance_variable_get(:@cards).dup
            shuffled_cards = deck.instance_variable_get(:@cards).shuffle!
            
            expect(duped_cards).to_not eq(shuffled_cards)
        end
    end

    describe "#take(n)" do
        subject(:deck) {Deck.new}
        it "takes card from top of deck" do
            expect(deck.take(3).map(&:value)).to eq(cards[0..2].map(&:value))
        end

        context "when n is greater than number of cards" do
            it "should raise an ArgumentError" do
                expect{deck.take(53)}.to raise_error(ArgumentError)
            end
        end
    end
end