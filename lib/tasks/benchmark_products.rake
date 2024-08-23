namespace :benchmark do
  desc "Benchmark product retrieval with different prices count and base price retrieval"

  task products: :environment do
    require 'benchmark'

    raise "Please run rake db:seed" unless Product.count > 0

    [100, 200, 300].each do |count|
      require 'benchmark'

      puts "Time to retrieve base prices for product with #{count} prices."

      Benchmark.bmbm do |bm|
        bm.report('100 times') { 100.times { Product.with_min_prices_count(count).first.base_prices.first } }
        bm.report('200 times') { 200.times { Product.with_min_prices_count(count).first.base_prices.first } }
        bm.report('500 times') { 500.times { Product.with_min_prices_count(count).first.base_prices.first } }
        bm.report('1000 times') { 1000.times { Product.with_min_prices_count(count).first.base_prices.first } }
      end
    end
  end
end
