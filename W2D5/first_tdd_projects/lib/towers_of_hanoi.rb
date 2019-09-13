class TowersOfHanoi
    attr_reader :towers

    def initialize
         @towers = Array.new(3) {Array.new()}
         @towers[0] += [3,2,1]
    end

    def move(from_tower, to_tower)
        @towers[to_tower].push(@towers[from_tower].pop)
    end

    def valid_move?(from_tower, to_tower)
        return false if @towers[from_tower].empty?
        if @towers[to_tower].last != nil
            return false if @towers[from_tower].last > @towers[to_tower].last
        end

        return true
    end

    def won?
        if @towers[1].length == 3 || @towers[2].length == 3
            return true
        else
            return false
        end
    end

    def play 
        self.render
        if !self.won?
            print "Enter the tower you want to take the disc from: "
            from_tower = gets.chomp.to_i
            print "Enter the tower you want to put the disc on: "
            to_tower = gets.chomp.to_i
        else
            p "You win!"
            return
        end

        if valid_move?(from_tower, to_tower)
            move(from_tower, to_tower)
            self.play
        else
            p "Move is not valid, try again"
            self.play
        end
    end

    def render
        display = Array.new(3) {Array.new(3, " ")}

        @towers.each_with_index do |tower, i|
            tower.each_with_index do |disc, j|
                if disc != nil
                    display[i][j] = disc.to_s
                end
            end
        end

        puts "|" + display[0][2] + "|" + display[1][2] + "|" + display[2][2] + "|"
        puts "|" + display[0][1] + "|" + display[1][1] + "|" + display[2][1] + "|"
        puts "|" + display[0][0] + "|" + display[1][0] + "|" + display[2][0] + "|"
    end
end