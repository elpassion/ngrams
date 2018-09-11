require 'tree'
require 'tokenizers/basic'

class NGramsCounter
  attr_reader :tokens

  def initialize(text, tokenizer: Tokenizers::Basic.new)
    @tokens = tokenizer.tokenize(text)
  end

  def most_frequent(n: 3, count: 10)
    tree = Tree.new

    tokens.each_cons(n) do |cons|
      tree.index(cons)
    end

    tree.ngrams.take(count)
  end
end
