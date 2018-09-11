require 'tokenizers/basic'
require 'ngrams/basic'
require 'ngrams_counters/tree'

class NGramsCounter
  attr_reader :tokens

  def initialize(text,
                 text_tokenizer: Tokenizers::Basic,
                 ngrams: NGrams::Basic,
                 ngrams_counter: NGramsCounters::Tree)
    @tokens = text_tokenizer.new.tokenize(text)
    @ngrams = ngrams.new(@tokens)
    @ngrams_counter = ngrams_counter
  end

  def most_frequent(n: 3, count: 10)
    counter = ngrams_counter.new

    ngrams.with_each_ngram(n) do |ngram|
      counter.index(ngram)
    end

    counter.ngrams.take(count)
  end

  private

  attr_reader :ngrams, :ngrams_counter
end
