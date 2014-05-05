module Kruskal
  class Forest
    include Enumerable

    def initialize
      @trees = {}
    end

    def new_tree(value = 0, source, target)
      Tree.new(self, [[value, source, target]])
    end

    def to_a
      @trees.values.uniq
    end

    def find_tree_for(node)
      @trees[node]
    end

    def index(node, tree)
      @trees[node] = tree
    end

    def [](position)
      to_a[position]
    end

    def each
      to_a.each do |tree|
        yield tree
      end
    end

    def size
      to_a.size
    end
  end
end
