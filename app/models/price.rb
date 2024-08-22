class Price
  include Mongoid::Document
  include Mongoid::Timestamps

  field :value, type: Integer
  field :currency, type: String

  embedded_in :product, touch: true
end
