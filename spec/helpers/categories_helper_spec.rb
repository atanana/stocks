require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CategoriesHelper. For example:
#
# describe CategoriesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CategoriesHelper, type: :helper do
  context 'with category' do
    let (:category) { create :category }

    it 'valid convert category' do
      converted = helper.convert_categories([category]).first
      expect(converted[:name]).to eq(category.name)
      expect(converted[:id]).to eq(category.id)
    end

    context 'with categories' do
      let (:category2) { create :category, name: 'test category 2' }
      let (:category3) { create :category, name: 'test category 3' }

      it 'valid convert categories' do
        converted = helper.convert_categories([category, category2, category3])
        expect(converted.size).to eq(3)
        expect(converted.last[:name]).to eq(category3.name)
      end
    end
  end
end
