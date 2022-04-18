require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it 'should have a valid factory' do
    expect(create(:menu_item_with_categories)).to be_valid
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
end
