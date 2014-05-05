require 'spec_helper'

describe Kruskal::Tree do
  let(:forest) { Kruskal::Forest.new }

  describe '#==' do
    it 'compares content' do
      t1 = forest.new_tree('a', 'b')
      t2 = forest.new_tree('a', 'b')
      t3 = forest.new_tree('a', 'c')

      expect(t1).to eq t1
      expect(t1).to eq t2
      expect(t1).to_not eq t3
    end

    it 'compares with Array' do
      t1 = forest.new_tree('a', 'b')

      expect(t1).to eq [[0, 'a', 'b']]
    end
  end

  describe '#hash' do
    it 'is the same for same content' do
      t1 = forest.new_tree('a', 'b')
      t2 = forest.new_tree('a', 'b')
      t3 = forest.new_tree('a', 'c')

      expect(t1.hash).to eq t2.hash
      expect(t1.hash).to_not eq t3.hash
    end
  end

  describe 'merge!' do
    it 'adds the content of one tree to the other' do
      t1 = forest.new_tree('a', 'b')
      t2 = forest.new_tree('b', 'c')

      t1.merge!(t2)

      expect(t1).to include [0, 'a', 'b']
      expect(t1).to include [0, 'b', 'c']
    end
  end
end
