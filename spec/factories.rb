FactoryGirl.define do
  factory :category do
    name 'test category'
  end

  factory :product_type do
    name 'test product type'
  end

  factory :product_packing do
    name 'test product packing'
  end

  factory :product do
    open false
    association :category, factory: :category
    association :product_type, factory: :product_type
    association :product_packing, factory: :product_packing
  end
end