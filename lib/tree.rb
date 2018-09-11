require 'tree/node'

class Tree
  attr_reader :root
  attr_reader :occurances
  attr_reader :leafs

  def initialize
    @root = Node.new(tree: self)
    @occurances = Hash.new(0)
    @leafs = []
  end

  def index(tokens)
    @root.index(tokens)
  end

  def ngrams
    @occurances.map do |node, value|
      [node.ngram.join(' '), value]
    end
  end

  def increment_occurance(node)
    @occurances[node] += 1
  end

  def build_node(token, parent: nil)
    Node.new(token, parent: parent, tree: self)
  end
end
