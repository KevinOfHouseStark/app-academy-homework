require "byebug"
require_relative "00_tree_node"

class KnightPathFinder
    attr_reader :root_node, :start_pos 

    POSSIBLE_MOVES = [
        [1, 2],
        [1, -2],
        [-1, 2],
        [-1, -2],
        [2, 1],
        [2, -1],
        [-2, 1],
        [-2, -1],
    ]

    def self.valid_moves?(pos)
        valid_positions = []

        POSSIBLE_MOVES.each do |x, y|
            new_pos = [pos[0] + x, pos[1] + y]

            valid_positions << new_pos if KnightPathFinder.in_bounds?(new_pos)
        end

        valid_positions
    end

    def self.in_bounds?(pos)
        x, y = pos

        x.between?(0,7) && y.between?(0,7)
    end
    
    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
    end

    def build_move_tree
        queue = [self.root_node]

        until queue.empty?
            current_node = queue.shift

            new_move_positions(current_node.value).each do |pos|
                next_node = PolyTreeNode.new(pos)
                current_node.add_child(next_node)
                queue.push(next_node)
            end
        end
    end

    def new_move_positions(pos)
        new_positions = []

        new_positions += KnightPathFinder.valid_moves?(pos)
        filtered_positions = new_positions.select {|pos| !@considered_positions.include?(pos)}
        @considered_positions.concat(filtered_positions)

        filtered_positions
    end

    def find_path(end_pos)
        target_node = @root_node.bfs(end_pos)

        path = trace_path_back(target_node).map {|node| node.value}.reverse
    end

    def trace_path_back(target_node)
        nodes = []
        current_node = target_node

        until current_node.nil?
            nodes << current_node
            current_node = current_node.parent
        end

        nodes
    end

    def test_valid_moves
        p KnightPathFinder.valid_moves?(@root_node.value)
    end

    def test_new_move_positions
        p new_move_positions(@root_node.value)
    end

    def test_build_move_tree
        build_move_tree
        p self.root_node.children
    end
end

# TEST CASES
#kpf = KnightPathFinder.new([4,4])

#kpf.test_valid_moves
#2.times {kpf.test_new_move_positions}
#kpf.test_build_move_tree

kpf = KnightPathFinder.new([0, 0])
kpf.build_move_tree
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
