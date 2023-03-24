class PolyTreeNode
    # attr_reader :parent, :children, :value

    def initialize(node_name)
        @new_node = node_name
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @new_node
    end

    # def parent=(property)
    #     @children << 
    # end
end