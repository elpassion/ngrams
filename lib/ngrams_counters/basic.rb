module NGramsCounters
  class Basic
    attr_reader :occurances

    Result = Struct.new(:ngram, :count)

    def initialize
      @occurances = {}
    end

    def index(ngram)
      key = ngram.join('-')
      result = occurances[key]
      if result
        result.count = result.count + 1
      else
        occurances[key] = Result.new(ngram, 1)
      end
    end

    def ngrams
      occurances.values
        .sort_by { |result| result.count }.reverse!
        .map { |result| [result.ngram.join(' '), result.count] }
    end
  end
end
