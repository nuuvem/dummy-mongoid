require 'faker'

# Clear existing data
Product.delete_all

# Helper method to generate random prices
def generate_prices(count)
  Array.new(count) do
    Price.new(
      value: rand(1..1000),
      currency: Faker::Currency.code
    )
  end
end

# List of price counts to create
price_counts = [1, 10, 50, 100, 150, 250, 300]

1000.times do |count|
  price_count = price_counts.sample

  product = Product.create!(
    name: Faker::Commerce.product_name,
    sku: Faker::Number.unique.number(digits: 6),
    prices: generate_prices(price_count)
  )
  puts "Created product #{product.name} with #{price_count} prices."
end
