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
  end
end
