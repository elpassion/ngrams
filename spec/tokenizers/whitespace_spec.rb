require 'ngrams_counter'

RSpec.describe Tokenizers::Whitespace do
  let(:text) { "ala ma kot\nkot ma ala ma" }

  describe '#tokenize' do
    subject { described_class.new.tokenize(text) }

    it 'splits text by whitespaces' do
      is_expected.to eq(['ala', 'ma', 'kot', 'kot', 'ma', 'ala', 'ma'])
    end
  end
end
