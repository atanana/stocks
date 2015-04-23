class Product < ActiveRecord::Base
  belongs_to :product_type, required: true
  belongs_to :product_packing, required: true
  belongs_to :category, required: true
end
