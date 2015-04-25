require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  context 'without categories' do
    it 'empty json array' do
      get :index
      expect(response.body).to eq({categories: []}.to_json)
    end

    it 'create new category' do
      post :create, category: {name: 'test category'}
      expect(Category.all.size).to eq(1)
      expect(Category.first.name).to eq('test category')
    end
  end

  context 'with categories' do
    let(:category1) { build :category, name: 'test category 1' }
    let(:category2) { build :category, name: 'test category 2' }

    before(:each) do
      category1.save
      category2.save
    end

    it 'valid json with categories' do
      get :index
      data = JSON.parse(response.body)
      expect(data.key? 'categories').to eq(true)
      expect(data['categories'].size).to eq(2)
    end

    context 'with products' do
      let (:product1) { build :product, category: category1 }
      let (:product2) { build :product, category: category2 }

      before(:each) do
        product1.save
        product2.save
      end

      it 'valid json with products' do
        get :show, id: category1.id
        data = JSON.parse(response.body)
        expect(data.key? 'category').to eq(true)
        expect(data['category'].key? 'products').to eq(true)
        expect(data['category']['products'].size).to eq(1)
      end
    end

    context 'update category' do
      it 'should update category' do
        old_name = category1.name
        new_name = 'test'
        put :update, id: category2.id, category: {name: new_name}
        expect(response.body).to eq('true')
        expect(Category.find(category2.id).name).to eq(new_name)
        expect(Category.find(category1.id).name).to eq(old_name)
      end
    end

    context 'delete category' do
      it 'should delete category' do
        delete :destroy, id:category1.id
        expect(Category.all.size).to eq(1)
      end
    end
  end
end
