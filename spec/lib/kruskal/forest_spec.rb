require 'spec_helper'

describe Kruskal::Forest do
  let(:index) { Kruskal::ForestIndex.new }

  describe '#==' do
    it 'compares Forest content' do
      f1 = index.new_forest('a', 'b')
      f2 = index.new_forest('a', 'b')
      f3 = index.new_forest('a', 'c')

      expect(f1).to eq f1
      expect(f1).to eq f2
      expect(f1).to_not eq f3
    end

    it 'compares with Array' do
      f1 = index.new_forest('a', 'b')

      expect(f1).to eq [[0, 'a', 'b']]
    end
  end

  describe '#hash' do
    it 'is equal for same content' do
      f1 = index.new_forest('a', 'b')
      f2 = index.new_forest('a', 'b')
      f3 = index.new_forest('a', 'c')

      expect(f1.hash).to eq f2.hash
      expect(f1.hash).to_not eq f3.hash
    end
  end
end
