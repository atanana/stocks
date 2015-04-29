class ProductTypeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :products

  def products
    object.product_ids
  end
end