require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  context 'with product' do
    let (:product) { build :product }

    before(:each) do
      product.save
    end

    it 'valid json of product' do
      get :show, id: product.id
      data = JSON.parse(response.body)
      expect(data.key? 'product').to eq(true)
    end

    it 'should update product attributes' do
      new_open = !product.open
      new_category = create :category
      new_product_type = create :product_type
      new_product_packing = create :product_packing
      put :update, id: product.id, product: {
                     open: new_open,
                     category_id: new_category.id,
                     product_type_id: new_product_type.id,
                     product_packing_id: new_product_packing.id
                 }
      product.reload
      expect(product.open).to eq(new_open)
      expect(product.category).to eq(new_category)
      expect(product.product_type).to eq(new_product_type)
      expect(product.product_packing).to eq(new_product_packing)
    end
  end
end
