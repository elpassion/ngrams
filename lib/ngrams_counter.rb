require 'tree/tree'
require 'tokenizers/basic'
require 'ngrams/basic'

class NGramsCounter
  attr_reader :tokens

  def initialize(text,
                 text_tokenizer: Tokenizers::Basic,
                 ngrams: NGrams::Basic)
    @tokens = text_tokenizer.new.tokenize(text)
    @ngrams = ngrams.new(@tokens)
  end

  def most_frequent(n: 3, count: 10)
    tree = Tree.new

    ngrams.with_each_ngram(n) do |ngram|
      tree.index(ngram)
    end

    tree.ngrams.take(count)
  end

  private

  attr_reader :ngrams
end
