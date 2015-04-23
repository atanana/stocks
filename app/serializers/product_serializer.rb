class ProductSerializer < ActiveModel::Serializer
  attributes :id, :open
  has_one :category, :product_type, :product_packing
end