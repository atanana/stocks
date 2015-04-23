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
  end
end
