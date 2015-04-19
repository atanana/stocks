require 'rails_helper'

RSpec.describe ProductPacking, type: :model do
  it { is_expected.to respond_to(:name) }

  context 'with name' do
    let(:product_packing) { FactoryGirl.build :product_packing }

    it 'is valid' do
      expect(product_packing).to be_valid
    end

    context 'with not unique name' do
      let(:product_packing2) { FactoryGirl.build :product_packing }

      it 'is not valid' do
        product_packing2.save
        expect(product_packing).to_not be_valid
      end
    end
  end

  context 'without name' do
    let(:product_packing) { FactoryGirl.build :product_packing, name: '' }

    it 'is not valid' do
      expect(product_packing).to_not be_valid
    end
  end
end
