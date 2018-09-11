require 'ngrams_counter'

RSpec.describe NGramsCounter do
  RSpec.shared_examples :ngram_counter do |text:, ngrams:, n: 2, size: 1|
    subject(:counter) { described_class.new(text, max_length: n) }
    let(:text) { text }

    describe '#most_frequent' do
      it 'returns valid results' do
        result = counter.most_frequent(n: n, count: size)
        expect(result).to eq(ngrams)
      end
    end
  end

  it_behaves_like :ngram_counter, n: 2, size: 1,
    text: 'ala ma kot kot ma ala ma',
    ngrams: [['ala ma', 2]]

  it_behaves_like :ngram_counter, n: 2, size: 2,
    text: 'ala ma kot kot ma ala ma kot i ma kot',
    ngrams: [['ma kot', 3], ['ala ma', 2]]
end
