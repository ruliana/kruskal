module Kruskal
  class ForestIndex
    extend Forwardable

    def_delegators :@index, :[], :[]=

    def initialize
      @index = {}
    end

    def new_forest(value = 0, source, target)
      Forest.new(self, [[value, source, target]])
    end

    def forests
      @index.values.uniq
    end
  end
end
