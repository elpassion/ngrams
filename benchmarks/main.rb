require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'benchmark-ips'
end

require_relative '../lib/ngrams_counter'

text = File.read('shakespeare-clean-smallest.txt')
basic = NGramsCounter.build(:basic)
tree = NGramsCounter.build(:tree)
sizes = (1..6)

Benchmark.ips do |benchmark|
  benchmark.config(warmup: 15, time: 25)

  sizes.each do |n|
    benchmark.report("Basic n=#{n}") do
      basic.most_frequent(text, n: n)
    end

    benchmark.report("Tree n=#{n}") do
      tree.most_frequent(text, n: n)
    end
  end

  benchmark.compare!
end
