require 'spec_helper'

describe Kruskal::MinimumSpanningTree do
  let (:kruskal) { Kruskal::MinimumSpanningTree.new }

  describe '#add' do
    it 'creates a forest' do
      kruskal.add('a', 'b')
      expect(kruskal.forest.size).to eq 1
      expect(kruskal.forest.first).to eq [[0, 'a', 'b']]
    end

    it 'creates more forests' do
      kruskal.add('a', 'b')
      kruskal.add('c', 'd')
      expect(kruskal.forest.size).to eq 2
      expect(kruskal.forest).to include [[0, 'a', 'b']]
      expect(kruskal.forest).to include [[0, 'c', 'd']]
    end

    it 'expands a forest' do
      kruskal.add('a', 'b')
      kruskal.add('b', 'c')
      expect(kruskal.forest.size).to eq 1
      expect(kruskal.forest.first).to eq [[0, 'a', 'b'], [0, 'b', 'c']]
    end

    it 'joins forests' do
      kruskal.add('a', 'b')
      kruskal.add('c', 'd')
      kruskal.add('d', 'a')
      expect(kruskal.forest.size).to eq 1
      tree = kruskal.forest.first
      expect(tree).to include [0, 'a', 'b']
      expect(tree).to include [0, 'c', 'd']
      expect(tree).to include [0, 'd', 'a']
    end

    it 'ignores connections in the same forest' do
      kruskal.add('a', 'b')
      kruskal.add('c', 'd')
      kruskal.add('d', 'a')
      kruskal.add('a', 'c')
      tree = kruskal.forest.first
      expect(tree).to include [0, 'd', 'a']
      expect(tree).to_not include [0, 'a', 'c']
    end
  end

  describe '#run' do
    it 'creates a single minimum spanning tree' do
      data = [[10, 'a', 'b'],
              [9, 'c', 'd'],
              [8, 'b', 'c'],
              [7, 'b', 'd']]
      kruskal.run(data)
      expect(kruskal.forest.size).to eq 1

      tree = kruskal.forest.first
      expect(tree).to include [10, 'a', 'b']
      expect(tree).to include [9, 'c', 'd']
      expect(tree).to include [8, 'b', 'c']
      expect(tree).to_not include [7, 'b', 'd']
    end

    it 'creates more trees when not nodes do not connecte' do
      data = [[10, 'a', 'b'],
              [9, 'c', 'd'],
              [8, 'e', 'f'],
              [7, 'g', 'h'],
              [6, 'd', 'a'],
              [5, 'e', 'g']]
      kruskal.run(data)
      expect(kruskal.forest.size).to eq 2

      tree1 = kruskal.forest[0]
      expect(tree1).to include [10, 'a', 'b']
      expect(tree1).to include [9, 'c', 'd']
      expect(tree1).to include [6, 'd', 'a']
      expect(tree1).to_not include [8, 'e', 'f']
      expect(tree1).to_not include [7, 'g', 'h']
      expect(tree1).to_not include [5, 'e', 'g']

      tree2 = kruskal.forest[1]
      expect(tree2).to_not include [10, 'a', 'b']
      expect(tree2).to_not include [9, 'c', 'd']
      expect(tree2).to_not include [6, 'd', 'a']
      expect(tree2).to include [8, 'e', 'f']
      expect(tree2).to include [7, 'g', 'h']
      expect(tree2).to include [5, 'e', 'g']
    end
  end
end
