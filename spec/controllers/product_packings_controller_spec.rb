require 'rails_helper'

RSpec.describe ProductPackingsController, type: :controller do
  context 'with product packing' do
    let (:product_packing) { build :product_packing }

    before(:each) do
      product_packing.save
    end

    it 'valid json of product packing' do
      get :show, id: product_packing.id
      data = JSON.parse(response.body)
      expect(data.key? 'product_packing').to eq(true)
    end

    context 'with product packings' do
      let (:product_packing2) { create :product_packing }

      before(:each) do
        product_packing.save
        product_packing2.save
      end

      it 'valid json of product packings' do
        get :index
        data = JSON.parse(response.body)
        expect(data.key? 'product_packings').to eq(true)
        expect(data['product_packings'].size).to eq(2)
      end

      it 'should update product packing' do
        old_name = product_packing.name
        new_name = 'test'
        put :update, id: product_packing2.id, product_packing: {name: new_name}
        expect(response.body).to eq('true')
        expect(ProductPacking.find(product_packing2.id).name).to eq(new_name)
        expect(ProductPacking.find(product_packing.id).name).to eq(old_name)
      end

      it 'should delete product packing' do
        delete :destroy, id:product_packing.id
        expect(ProductPacking.all.size).to eq(1)
        expect { ProductPacking.find product_packing.id }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  context 'without product packings' do
    it 'create new product packing' do
      post :create, product_packing: {name: 'test product packing'}
      expect(ProductPacking.all.size).to eq(1)
      expect(ProductPacking.first.name).to eq('test product packing')
    end
  end
end
