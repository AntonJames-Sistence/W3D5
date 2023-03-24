class PolyTreeNode
    # attr_reader :parent, :children, :value

    def initialize(node_name, children)
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

    def parent=(property)
        @parent.children << property
    end
end