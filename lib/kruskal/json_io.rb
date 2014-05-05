require 'json'

module Kruskal
  class JsonIO
    include Enumerable

    def initialize(an_io)
      @origin = an_io
      @first = true
    end

    def each
      @origin.each_line do |it|
        yield JSON.parse(it)
      end
    end

    def <<(object)
      a_string = if @first
                   @first = false
                   JSON.generate(object)
                 else
                   "\n#{JSON.generate(object)}"
                 end
      @origin << a_string
    end
  end
end
