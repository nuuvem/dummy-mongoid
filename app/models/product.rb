class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :sku, type: Integer

  embeds_many :prices, cascade_callbacks: true, validate: false

  index({_id: 1, sku: -1}, background: true)
  index({sku: 1}, background: true, unique: true)
  index({updated_at: -1}, background: true)

  index({'prices.created_at' => -1}, background: true)
  index({'prices.updated_at' => -1}, background: true)

  scope :with_min_prices_count, ->(min_count) {
    where(:'$expr' => { :$gte => [ { :$size => "$prices" }, min_count ] })
  }

  def base_prices
    prices.where(kind: :base).to_a
  end
end
