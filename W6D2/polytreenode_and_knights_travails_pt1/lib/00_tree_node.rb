module Searchable
    def dfs(target)
        return self if self.value == target

        children.each do |child|
            search = child.dfs(target)
            return search if !search.nil?
        end

        nil
    end

    def bfs(target)
        queue = [self]

        until queue.empty?
            current_node = queue.shift
            return current_node if current_node.value == target
            queue.concat(current_node.children)
        end

        nil
    end
end

class PolyTreeNode
    attr_accessor :value, :children
    attr_reader :parent

    include Searchable

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        return if self.parent == parent

        self.parent.children.delete(self) if !@parent.nil?

        @parent = parent
        self.parent.children << self if !self.parent.nil?
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        raise 'Argument is not a child node' if !self.children.include?(child)
        
        child.parent = nil
    end
end