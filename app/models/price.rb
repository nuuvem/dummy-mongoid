class Price
  include Mongoid::Document
  include Mongoid::Timestamps

  field :value, type: Integer
  field :currency, type: String
  field :kind, type: Symbol

  embedded_in :product, touch: true
end
