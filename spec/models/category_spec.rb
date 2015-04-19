require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to respond_to(:name) }

  context 'with name' do
    let(:category) { build :category }

    it 'is valid' do
      expect(category).to be_valid
    end

    context 'with not unique name' do
      let(:category2) { build :category }

      it 'is not valid' do
        category2.save
        expect(category).to_not be_valid
      end
    end
  end

  context 'without name' do
    let(:category) { build :category, name: '' }

    it 'is not valid' do
      expect(category).to_not be_valid
    end
  end
end
