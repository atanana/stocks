require 'rails_helper'

RSpec.describe ProductType, type: :model do
  it { is_expected.to respond_to(:name) }

  context 'with name' do
    let(:product_type) { build :product_type }

    it 'is valid' do
      expect(product_type).to be_valid
    end

    context 'with not unique name' do
      let(:product_type2) { build :product_type }

      it 'is not valid' do
        product_type2.save
        expect(product_type).to_not be_valid
      end
    end
  end

  context 'without name' do
    let(:product_type) { build :product_type, name: '' }

    it 'is not valid' do
      expect(product_type).to_not be_valid
    end
  end
end
