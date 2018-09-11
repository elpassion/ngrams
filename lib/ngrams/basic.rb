module NGrams
  class Basic
    attr_reader :tokens

    def initialize(tokens)
      @tokens = tokens
    end

    def with_each_ngram(n)
      tokens.each_cons(n) do |cons|
        yield(cons)
      end
    end
  end
end
