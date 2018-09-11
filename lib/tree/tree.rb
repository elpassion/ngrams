require 'tree/node'

class Tree
  attr_reader :root
  attr_reader :occurances

  def initialize
    @root = Node.new(tree: self)
    @occurances = Hash.new(0)
  end

  def index(tokens)
    @root.index(tokens)
  end

  def ngrams
    @occurances
      .sort_by { |_node, value| -value }
      .map { |node, value| [node.ngram.join(' '), value] }
  end

  def increment_occurance(node)
    @occurances[node] += 1
  end

  def build_node(token, parent: nil)
    Node.new(token, parent: parent, tree: self)
  end
end
