class Tree
  class Occurance
    attr_reader :value
    attr_reader :node

    def initialize(node)
      @value = 0
      @node = node
    end

    def increment!
      @value = value + 1
    end

    def to_s
      node.ngram.join(' ')
    end

    def <=>(other)
      @value <=> other
    end
  end
end
