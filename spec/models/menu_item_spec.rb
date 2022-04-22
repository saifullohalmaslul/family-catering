require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it 'should have a valid factory' do
    expect(create(:menu_item)).to be_valid
  end

  it 'should have an invalid factory' do
    expect(build(:invalid_menu_item)).to be_invalid
  end
  
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }
    it { should validate_length_of(:description).is_at_most(150) }
    it { should validate_presence_of(:categories) }
  end

  describe 'associations' do
    it { should have_many(:categories) }
  end

  describe '#category_names' do
    it 'should return its category names' do
      categories = [
        create(:category, name: "Indonesian"),
        create(:category, name: "Hot"),
        create(:category, name: "Beverage")
      ]

      menu_item = build(:menu_item)
      menu_item.categories = categories

      expect(menu_item.category_names).to eq "Indonesian, Hot, Beverage"
    end
  end

  describe '#category_names=' do
    it 'should asign its categories with the name' do
      menu_item = build(:menu_item)
      menu_item.category_names = "Indonesian, Cold, Beverage"
      menu_item.save
      
      expect(menu_item.categories.pluck(:name)).to eq ["Indonesian", "Cold", "Beverage"]
    end
  end
end
