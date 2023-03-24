class PolyTreeNode
    # attr_reader :parent, :children, :value

    def initialize(new_node)
        @value = new_node
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
        @value
    end

    def parent=(my_parent_node)

        if self.parent == nil
            my_parent_node.children << self
            @parent = my_parent_node
        elsif my_parent_node == nil
            @parent.children.delete(self)
            @parent = my_parent_node
        else
            @parent.children.delete(self)
            my_parent_node.children << self
            @parent = my_parent_node
        end
    end
end