class Category < ActiveRecord::Base
  belongs_to :product, inverse_of: :products
  validates :name, presence: true, uniqueness: true
end
