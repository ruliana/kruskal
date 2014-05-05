module Kruskal
  class Forest
    extend Forwardable
    include Enumerable

    def_delegators :@forest, :each

    def initialize(index, forest = [])
      @index, @forest = index, forest
      reindex
    end

    def eql?(other)
      if other.is_a?(self.class)
        other.equal_content(@forest)
      elsif other.is_a?(Array)
        @forest == other
      else
        false
      end
    end

    alias == eql?

    def hash
      @forest.hash
    end

    def add(value, source, target)
      @forest << [value, source, target]
      index(target)
    end

    def merge!(forest)
      forest.add_internal_to(@forest)
      forest.each do |(v, s, t)|
        index(s, t)
      end
    end

    def inspect
      "Forest#{@forest.inspect}"
    end

    protected
    def add_internal_to(forest_array)
      forest_array.concat(@forest)
    end

    def equal_content(forest_array)
      forest_array == @forest
    end

    private
    def index(*nodes)
      nodes.each do |it|
        @index[it] = self
      end
    end

    def reindex
      @forest.each do |(v, s, t)|
        index(s, t)
      end
    end
  end
end
