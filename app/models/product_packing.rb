class ProductPacking < ActiveRecord::Base
  has_many :products, inverse_of: :product_packing
  validates :name, presence: true, uniqueness: true
end
