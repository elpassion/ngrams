module NGramsCounters
  class Tree
    class Node
      attr_reader :value
      attr_reader :children
      attr_reader :parent
      attr_reader :tree

      def initialize(value = nil, parent: nil, tree: nil)
        @value = value
        @parent = parent
        @tree = tree
        @children = {}
      end

      def index(tokens)
        if tokens.empty?
          return tree.increment_occurance(self)
        end
        node_token, *rest_tokens = tokens

        node = find_children(node_token) || build_children(node_token)
        node.index(rest_tokens)
      end

      def ngram
        return [] unless value
        parent.ngram.push(*value)
      end

      private

      def find_children(token)
        children[token]
      end

      def build_children(token)
        tree.build_node(token, parent: self).tap do |node|
          children[token] = node
        end
      end
    end
  end
end
