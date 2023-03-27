require_relative "tree_node.rb"

class KnightPathFinder
    # attr_reader :position

    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @position = position
        @considered_positions = [position]
    end

    # def bfs(target) 
    #     queue = [self]

    #     until queue.empty?
    #         node = queue.shift
    #         return node if node.value == target
    #         node.children.each do |child|
    #             queue.push(child)
    #         end
    #     end
    #     nil
    # end

    def build_move_tree
        queue = [@root_node]

        until queue.empty?
            node = queue.shift
            possible_moves = new_move_positions(node)
            possible_moves.each do |position|
                next if @considered_positions.include?(position) #checks if we've been here before
                new_child = PolyTreeNode.new(position)
                new_child.parent= (node)
                queue << new_child
            end
        end
    end

    def self.valid_moves(pos) # pos => array[row, col] # this does not filter for out-of-bounds positions YET
        pos = row, col
        new_arr = []
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
        constant_moves.eaach do |move|
            move = dx, dy
            new_pos = [row + dx, col + dy]
            new_arr << new_pos if valid_position?(new_pos)
        end
        new_arr
    end

    def valid_position?(pos)
        pos = row, col
        if row < 0 || row > 7 
            return false
        elsif col < 0 || col > 7
            return false
        end
        true
    end

    def new_move_positions(pos)
        pos = row, col
        KnightPathFinder.valid_moves(pos).each do |position|
            @considered_positions << position if !@considered_positions.include?(position)
        end
    end
end