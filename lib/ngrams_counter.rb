require 'tree'
require 'tokenizers/basic'

class NGramsCounter
  attr_reader :root
  attr_reader :max_length
  attr_reader :trees
  attr_reader :trees
  attr_reader :tokens

  def initialize(text, max_length: 3, tokenizer: Tokenizers::Basic.new)
    @tokens = tokenizer.tokenize(text)
    @max_length = max_length
    @trees = (1..max_length).map { Tree.new }
    index
  end

  def most_frequent(n: 3, count: 10)
    # TODO: Replace max_length with n
    ngrams(max_length).take(count)
  end

  private

  def index
    trees[@max_length] = Tree.new

    tokens.each_cons(max_length) do |cons|
      trees[@max_length].index(cons)
    end
  end

  def ngrams(size)
    trees[size].ngrams
  end
end
