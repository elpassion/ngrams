require_relative './tokenizers/basic'
require_relative './ngrams/basic'
require_relative './ngrams_counters/tree'

class NGramsCounter
  attr_reader :tokens

  def self.build(type)
    case type
    when :tree
      new(text_tokenizer: Tokenizers::Basic,
          ngrams: NGrams::Basic,
          ngrams_counter: NGramsCounters::Tree)
    else
      raise "unknown type #{type}"
    end
  end

  def initialize(text_tokenizer:, ngrams:, ngrams_counter:)
    @text_tokenizer = text_tokenizer
    @ngrams = ngrams
    @ngrams_counter = ngrams_counter
  end

  def most_frequent(text, n: 3, count: 10)
    @tokens = tokenize(text)
    counter = ngrams_counter.new

    ngrams.new.with_each_ngram(tokens, n) do |ngram|
      counter.index(ngram)
    end

    counter.ngrams.take(count)
  end

  private

  def tokenize(text)
    text_tokenizer.new.tokenize(text)
  end

  attr_reader :text_tokenizer, :ngrams, :ngrams_counter
end
