require "rspec"
require "towers_of_hanoi"

describe TowersOfHanoi do
    let(:game) {TowersOfHanoi.new}
    let(:towers) {game.towers}

    describe "#towers" do
        it "returns the game's @towers instance variable" do
            instance_variable = game.instance_variable_get(:@towers)

            expect(towers).to be(instance_variable)
        end
    end

    describe "#initialize" do
        it "should create a 2D array of length 3" do
            expect(towers.length).to be(3)
        end

        it "by default, all discs are in the first tower" do
            expect(towers.map(&:length)).to eq([3, 0, 0])
        end

        it "sets the first tower to have disc 3 on the bottom, 2 in the middle, 1 on top" do
            expect(towers.first).to eq([3, 2, 1])
        end
    end

    describe "#move(from_tower, to_tower)" do
        let!(:disc) {towers[0].last}

        before(:each) do
            game.move(0, 2)
        end

        it "removes the top disc off of from_tower" do
            expect(towers[0].include?(1)).to be false
        end

        it "moves the disc to the correct to_tower" do
            expect(towers[2].include?(1)).to be true
        end
    end

    describe "#valid_move?(from_tower, to_tower)" do
        it "returns false when from_tower is empty" do
            expect(game.valid_move?(2, 1)).to be false
        end

        it "returns true when moving a smaller disc onto a larger disc or onto an empty tower" do
            expect(game.valid_move?(0, 2)).to be true
        end

        it "returns false when moving a larger disc onto a smaller one" do
            game.move(0,2)

            expect(game.valid_move?(0, 2)).to be false
        end
    end

    describe "#won?" do
        context "when the game has not been solved" do
            it "returns false" do
                expect(game.won?).to be false
            end
        end

        context "when game has been solved" do
            it "returns true" do
                [[0, 1], [0, 2], [1, 2], [0, 1], [2, 0], [2, 1], [0, 1]].each do |move|
                    game.move(*move)
                end

                expect(game.won?).to be true
            end
        end
    end
end