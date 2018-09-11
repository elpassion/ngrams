module NGrams
  class Basic
    def with_each_ngram(tokens, n)
      tokens.each_cons(n) do |cons|
        yield(cons)
      end
    end
  end
end
