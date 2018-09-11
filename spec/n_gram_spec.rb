require 'ngrams_counter'

RSpec.describe NGramsCounter do
  subject(:counter) { described_class.new(text, max_length: 2) }

  let(:text) {
    'ala ma kot kot ma ala ma'
  }

  describe '#most_frequent' do
    it 'returns valid results' do
      result = counter.most_frequent(n: 2, count: 1)
      expect(result).to eq([['ala ma', 2]])
    end
  end
end
