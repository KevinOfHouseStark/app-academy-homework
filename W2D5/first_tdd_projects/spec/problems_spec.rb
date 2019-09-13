require "rspec"
require "problems"

describe "#my_uniq" do
    it "removes duplicates" do
        expect([1, 2, 1, 3 ,3].my_uniq).to eq([1, 2, 3])
    end
end

describe "#two_sum" do
    it "finds matching pairs" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4],[2, 3]])
    end
end

describe "#my_transpose" do

    let(:rows) {[
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ]}

    it "transposes a matrix" do
        # rows = [
        #     [0, 1, 2],
        #     [3, 4, 5],
        #     [6, 7, 8]
        # ]

        cols = [
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8]
        ]

        expect(rows.my_transpose).to eq(cols)
    end

    it "does not receive #transpose" do
        expect(rows).not_to receive(:transpose)
    end
end

describe "#stock_picker" do
    it "finds a pair of the most profitable indices" do
        expect(stock_picker([4, 3, 1, 7, 6, 11, 9])).to eq([2, 5])
    end

    it "does not buy after sell" do
        expect(stock_picker([4, 3, 11, 7, 6, 1, 9])).not_to eq([5, 2])
    end

    it "does not return a pair if there are no profitable pairs" do
        expect(stock_picker([5, 4, 3, 2, 1])).to be_nil
    end
end
