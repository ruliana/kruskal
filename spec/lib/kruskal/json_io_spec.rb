require 'spec_helper'

describe Kruskal::JsonIO do
  it 'reads JSON in lines, outputs Ruby objects' do
    input = StringIO.new("[1, 2]\n[3, 4]\n[5, 6]")
    reader = Kruskal::JsonIO.new(input)
    objects = reader.map { |it| it }
    expect(objects.size).to eq 3
    expect(objects.first).to eq [1, 2]
    expect(objects.last).to eq [5, 6]
  end

  it 'writes object as JSON' do
    output = StringIO.new
    writer = Kruskal::JsonIO.new(output)
    writer << [1, 2]
    writer << [3, 4]
    expect(output.string).to eq "[1,2]\n[3,4]"
  end
end
