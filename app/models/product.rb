class Product < ActiveRecord::Base
  belongs_to :product_type, required: true, foreign_key: :product_types_id
  belongs_to :product_packing, required: true, foreign_key: :product_packings_id
  belongs_to :category, required: true, foreign_key: :categories_id

  attr_accessor :product_type, :product_packing, :category
end
