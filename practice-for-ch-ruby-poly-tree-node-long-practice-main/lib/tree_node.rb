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

    def add_child(child)
        child.parent=(self)
    end

    def remove_child(child)
        child.parent=(nil)
        raise "invalid child" if child == nil  #maybe revisit
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

    def dfs(target)
        # return nil if self == nil
        return self if self.value == target
        self.children.each do |child|
            search_step = child.dfs(target)
            return search_step unless search_step == nil
        end
        nil
    end
end
