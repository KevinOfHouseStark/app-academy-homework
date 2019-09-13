require "rspec"
require "card"

describe Card do
    describe "::suits" do
        it "returns an array of all possible suits" do
            [:spades, :clubs, :hearts, :diamonds].each do |suit|
                expect(Card.suits.include?(suit)).to be true
            end
        end
    end

    describe "::values" do
        it "returns an array of all possible values" do
            [:ace, :deuce, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king].each do |value|
                expect(Card.values.include?(value)).to be true
            end
        end
    end

    describe "#initialize(card, value)" do
        subject(:card) {Card.new(:spades, :ace)}

        it "sets the correct suit and value if they are included" do
            expect(card.suit).to eq(:spades)
            expect(card.value).to eq(:ace)
        end
    end

    describe "#==(other)" do
        subject(:card) {Card.new(:spades, :ace)}

        it "returns false when passed in nil" do
            expect(card == nil).to be_falsy
        end

        context "when a card with the same suit and value is passed" do
            let(:other) {Card.new(:spades, :ace)}
            
            it "returns true" do
                expect(card == other).to be true
            end
        end

        context "when a card with a different suit or value is passed" do
            let(:other) {Card.new(:hearts, :ace)}
            it "returns false" do
                expect(card == other).to be false
            end
        end
    end

    describe "#to_s" do
        subject(:card) {Card.new(:spades, :ace)}

        it "returns a string with value and suit" do
            expect(card.to_s).to eq("A♠")
        end
    end
end