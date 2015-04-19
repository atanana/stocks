require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to respond_to(:open) }
  it { is_expected.to respond_to(:product_type) }
  it { is_expected.to respond_to(:product_packing) }
  it { is_expected.to respond_to(:category) }

  context 'with all associations' do
    let (:product) { build :product }

    it 'is valid' do
      expect(product).to be_valid
    end

    it 'should not deleted by delete category, type or packing' do
      product.save
      product.category.destroy
      product.product_type.destroy
      product.product_packing.destroy
      expect(Product.all.size).to eq(1)
    end
  end

  context 'without category' do
    let (:product) { build :product, category: nil }

    it 'is not valid' do
      expect(product).to_not be_valid
    end
  end

  context 'without product type' do
    let (:product) { build :product, product_type: nil }

    it 'is not valid' do
      expect(product).to_not be_valid
    end
  end

  context 'without product packing' do
    let (:product) { build :product, product_packing: nil }

    it 'is not valid' do
      expect(product).to_not be_valid
    end
  end
end
