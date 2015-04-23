FactoryGirl.define do
  factory :category do
    name { SecureRandom.hex }
  end

  factory :product_type do
    name { SecureRandom.hex }
  end

  factory :product_packing do
    name { SecureRandom.hex }
  end

  factory :product do
    open false
    association :category
    association :product_type
    association :product_packing
  end
end