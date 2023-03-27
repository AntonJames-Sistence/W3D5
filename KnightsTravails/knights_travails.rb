require_relative "tree_node.rb"
require "byebug"

class KnightPathFinder
    # attr_reader :position

    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @position = position
        @considered_positions = [position]
        build_move_tree
    end

    def build_move_tree
        queue = [@root_node]
        # debugger
        until queue.empty?
            node = queue.shift
            @considered_positions << node.value
            possible_moves = all_valid_moves(node.value)
            possible_moves.each do |position|
                next if @considered_positions.include?(position) #checks if we've been here before
                new_child = PolyTreeNode.new(position)
                new_child.parent= (node)
                queue << new_child
            end
        end
    end

    def valid?(pos)
        row, col = pos
        if row < 0 || row > 7 
            return false
        elsif col < 0 || col > 7
            return false
        end
        true
    end

    def all_valid_moves(pos)
        all_moves = new_move_positions(pos)
        all_moves.select { |move| valid?(move) }
    end

    def self.valid_moves(pos) # pos => array[row, col]
        row, col = pos
        all_moves = []
        constant_moves = [
            [1, 2], 
            [-1, 2], 
            [1, -2], 
            [-1, -2],
            [2, 1],
            [-2, 1],
            [2, -1],
            [-2, -1]
        ]
        constant_moves.each do |move|
            dx, dy = move
            new_pos = [row + dx, col + dy]
            all_moves << new_pos
        end
        all_moves
    end

    def new_move_positions(pos)

         KnightPathFinder.valid_moves(pos).reject do |position|
            @considered_positions.include?(position)
        end
    end
end

kfs = KnightPathFinder.new([1, 1])
p kfs