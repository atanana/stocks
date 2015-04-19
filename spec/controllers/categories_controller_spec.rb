require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  context 'without categories' do
    it 'empty json array' do
      get :index
      expect(response.body).to eq([].to_json)
    end
  end

  context 'with categories' do
    let(:category1) { build :category, name: 'test category 1' }
    let(:category2) { build :category, name: 'test category 2' }

    it 'valid json with categories names and ids' do
      category1.save
      category2.save
      get :index
      result = [category1, category2].map do |category|
        {
            id: category.id,
            name: category.name
        }
      end
      expect(response.body).to eq(result.to_json)
    end
  end
end
