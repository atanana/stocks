require 'rails_helper'

RSpec.describe ProductTypesController, type: :controller do
  context 'with product type' do
    let (:product_type) { create :product_type }

    before(:each) do
      product_type.save
    end

    it 'valid json of product type' do
      get :show, id: product_type.id
      data = JSON.parse(response.body)
      expect(data.key? 'product_type').to eq(true)
    end

    context 'with product types' do
      let (:product_type2) { create :product_type }

      before(:each) do
        product_type.save
        product_type2.save
      end

      it 'valid json of product types' do
        get :index
        data = JSON.parse(response.body)
        expect(data.key? 'product_types').to eq(true)
        expect(data['product_types'].size).to eq(2)
      end
    end
  end

  context 'without product types' do
    it 'create new product type' do
      post :create, product_type: {name: 'test product type'}
      expect(ProductType.all.size).to eq(1)
      expect(ProductType.first.name).to eq('test product type')
    end
  end
end
