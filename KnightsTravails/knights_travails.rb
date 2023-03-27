require_relative "tree_node.rb"

class KnightPathFinder
    # attr_reader :position

    def initialize(position)
        @position = position
        # build_move_tree
    end

    def root_node
        @position
    end

    # def build_move_tree
        
    # end

    def self.valid_moves(pos) # pos => array[row, col]
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
        KnightPathFinder.valid_moves.each.select { |position| }
    end
end