require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'benchmark-ips'
end

require_relative '../lib/ngrams_counter'

text = 'elo co tam co tam'

tree = NGramsCounter.build(:tree)
sizes = (1..3)

Benchmark.ips do |benchmark|
  benchmark.report("Tree") do
    sizes.each do |n|
      tree.most_frequent(text, n: n)
    end
  end

  benchmark.report("Tree") do
    sizes.each do |n|
      tree.most_frequent(text, n: n)
    end
  end
end
