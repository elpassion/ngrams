module NGrams
  class Basic
    def with_each_ngram(tokens, n)
      tokens.each_cons(n) do |ngram|
        yield(ngram)
      end
    end
  end
end
