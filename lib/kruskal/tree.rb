module Kruskal
  class Tree
    extend Forwardable
    include Enumerable

    def_delegators :@relations, :each

    def initialize(index, relations = [])
      @index, @relations = index, relations
      reindex
    end

    def eql?(other)
      if other.is_a?(self.class)
        other.relations_equal_to(@relations)
      elsif other.is_a?(Array)
        @relations == other
      else
        false
      end
    end

    alias == eql?

    def hash
      @relations.hash
    end

    def add(value, source, target)
      @relations << [value, source, target]
      index(target)
    end

    def merge!(other_tree)
      other_tree.add_relations_to(@relations)
      other_tree.each do |(v, s, t)|
        index(s, t)
      end
    end

    def inspect
      "Tree#{@relations.inspect}"
    end

    protected
    def add_relations_to(an_array)
      an_array.concat(@relations)
    end

    def relations_equal_to(an_array)
      an_array == @relations
    end

    private
    def index(*nodes)
      nodes.each do |it|
        @index.index(it, self)
      end
    end

    def reindex
      @relations.each do |(v, s, t)|
        index(s, t)
      end
    end
  end
end
