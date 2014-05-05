require 'spec_helper'

describe Kruskal::MinimumSpanningTree do
  describe '#add' do
    let (:kruskal) { Kruskal::MinimumSpanningTree.new }

    it 'creates a forest' do
      kruskal.add('a', 'b')
      expect(kruskal.forests.size).to eq 1
      expect(kruskal.forests.first).to eq [[0, 'a', 'b']]
    end

    it 'creates more forests' do
      kruskal.add('a', 'b')
      kruskal.add('c', 'd')
      expect(kruskal.forests.size).to eq 2
      expect(kruskal.forests).to include [[0, 'a', 'b']]
      expect(kruskal.forests).to include [[0, 'c', 'd']]
    end

    it 'expands a forest' do
      kruskal.add('a', 'b')
      kruskal.add('b', 'c')
      expect(kruskal.forests.size).to eq 1
      expect(kruskal.forests.first).to eq [[0, 'a', 'b'], [0, 'b', 'c']]
    end

    it 'joins forests' do
      kruskal.add('a', 'b')
      kruskal.add('c', 'd')
      kruskal.add('d', 'a')
      expect(kruskal.forests.size).to eq 1
      forest = kruskal.forests.first
      expect(forest).to include [0, 'a', 'b']
      expect(forest).to include [0, 'c', 'd']
      expect(forest).to include [0, 'd', 'a']
    end

    it 'ignores connections in the same forest' do
      kruskal.add('a', 'b')
      kruskal.add('c', 'd')
      kruskal.add('d', 'a')
      kruskal.add('a', 'c')
      forest = kruskal.forests.first
      expect(forest).to include [0, 'd', 'a']
      expect(forest).to_not include [0, 'a', 'c']
    end
  end
end
