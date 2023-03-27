require_relative "tree_node.rb"

class KnightPathFinder
    # attr_reader :position

    def initialize(position)
        @position = position
        @considered_positions = [position]
    end

    def root_node
        @position
    end


    def bfs(target) 
        queue = [self]

        until queue.empty?
            node = queue.shift
            return node if node.value == target
            node.children.each do |child|
                queue.push(child)
            end
        end
        nil
    end

    def build_move_tree(target)
        queue = @considered_positions

        until queue.empty?
            node = queue.shift
            return node if node.position == target
            node.considered_positions.

    end

    def self.valid_moves(pos) # pos => array[row, col] # this does not filter for out-of-bounds positions YET
        pos = row, col
        possible_moves = [

        pos_pos1 = [row-2, col-1]
        pos_pos2 = [row-2, col+1]
        pos_pos3 = [row-1, col+2]
        pos_pos4 = [row+1, col+2]
        pos_pos5 = [row+2, col+1]
        pos_pos6 = [row+2, col-1]
        pos_pos7 = [row+1, col-2]
        pos_pos8 = [row-1, col-2]
        ]
    end

    def valid_moves?(pos)
        pos = row, col
        # KnightPathFinder.valid_moves.each.select { |position| } #
    end

    def new_move_positions(pos)
        pos = row, col
        KnightPathFinder.valid_moves(pos).each do |position|
            @considered_positions << position if !@considered_positions.include?(position)
        end
    end
end