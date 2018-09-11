module NGramsCounters
  class Basic
    attr_reader :occurances

    def initialize
      @occurances = Hash.new(0)
    end

    def index(ngram)
      occurances[ngram.join(' ')] += 1
    end

    def ngrams
      occurances
        .sort_by { |_node, value| -value }
        .map { |node, value| [node, value] }
    end
  end
end
