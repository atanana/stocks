class Category < ActiveRecord::Base
  has_many :products, inverse_of: :category
  validates :name, presence: true, uniqueness: true
end
