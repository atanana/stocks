require 'rails_helper'

RSpec.describe ProductTypesController, type: :controller do
  context 'with product type' do
    let (:product_type) { build :product_type }

    before(:each) do
      product_type.save
    end

    it 'valid json of product type' do
      get :show, id: product_type.id
      data = JSON.parse(response.body)
      expect(data.key? 'product_type').to eq(true)
    end
  end
end
