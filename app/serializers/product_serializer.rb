class ProductSerializer < ActiveModel::Serializer
  attributes :id, :open
  has_one :category, :product_type, :product_packing

  def category
    object.category_id
  end

  def product_type
    object.product_type_id
  end

  def product_packing
    object.product_packing_id
  end
end