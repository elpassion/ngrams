require_relative './tree/node'

module NGramsCounters
  class Tree
    attr_reader :root
    attr_reader :occurances

    def initialize
      @root = Node.new(tree: self)
      @occurances = Hash.new(0)
    end

    def index(ngram)
      root.index(ngram)
    end

    def ngrams
      occurances
        .sort_by { |_, count| count }.reverse!
        .map { |node, count| [node.ngram.join(' '), count] }
    end

    def increment_occurance(node)
      occurances[node] += 1
    end

    def build_node(token, parent: nil)
      Node.new(token, parent: parent, tree: self)
    end
  end
end
