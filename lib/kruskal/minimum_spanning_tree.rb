module Kruskal
  class MinimumSpanningTree
    attr_accessor :forest

    def initialize
      @forest = Forest.new
    end

    def add(value = 0, source, target)
      # Here is the full algorithm
      tree_source = find_tree_for(source)
      tree_target = find_tree_for(target)
      if tree_source.nil? && tree_target.nil?
        new_tree(value, source, target)
      elsif tree_source && tree_target.nil?
        tree_source.add(value, source, target)
      elsif tree_source.nil? && tree_target
        tree_target.add(value, source, target)
      elsif tree_source != tree_target
        tree_source.merge!(tree_target)
        tree_source.add(value, source, target)
      end
    end

    def run(data)
      data.each do |(value, source, target)|
        add(value, source, target)
      end
    end

    private
    def find_tree_for(node)
      @forest.find_tree_for(node)
    end

    def new_tree(value, source, target)
      @forest.new_tree(value, source, target)
    end
  end
end
