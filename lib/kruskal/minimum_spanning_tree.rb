module Kruskal
  class MinimumSpanningTree
    def initialize
      @index = ForestIndex.new
    end

    def forests
      @index.forests
    end

    def add(value = 0, source, target)
      forest_source = find_forest_for(source)
      forest_target = find_forest_for(target)
      if forest_source.nil? && forest_target.nil?
        new_forest(value, source, target)
      elsif forest_source && forest_target.nil?
        forest_source.add(value, source, target)
      elsif forest_source.nil? && forest_target
        forest_target.add(value, source, target)
      elsif forest_source != forest_target
        forest_source.merge!(forest_target)
        forest_source.add(value, source, target)
      end
    end

    private
    def find_forest_for(node)
      @index[node]
    end

    def new_forest(value, source, target)
      @index.new_forest(value, source, target)
    end
  end
end
