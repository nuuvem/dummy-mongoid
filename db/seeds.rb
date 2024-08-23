require 'faker'

# Clear existing data
Product.delete_all

# Helper method to generate random prices
def generate_prices(count)
  # Create the base price
  base_price = Price.new(
    value: rand(1..1000),
    currency: Faker::Currency.code,
    kind: :base
  )

  # Generate promo prices
  promo_prices = Array.new(count - 1) do
    base_price.clone.tap do |price|
      price.value = rand(1..1000)
      price.currency = Faker::Currency.code
      price.kind = :promo
    end
  end

  # Combine base price and promo prices
  [base_price] + promo_prices
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
