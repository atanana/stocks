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

      it 'should update product type' do
        old_name = product_type.name
        new_name = 'test'
        put :update, id: product_type2.id, product_type: {name: new_name}
        expect(response.body).to eq('true')
        expect(ProductType.find(product_type2.id).name).to eq(new_name)
        expect(ProductType.find(product_type.id).name).to eq(old_name)
      end

      it 'should delete product type' do
        delete :destroy, id:product_type.id
        expect(ProductType.all.size).to eq(1)
        expect { ProductType.find product_type.id }.to raise_error(ActiveRecord::RecordNotFound)
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
