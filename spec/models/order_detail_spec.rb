require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  it 'should have 1 as default for quantity' do
    expect(OrderDetail.new.quantity).to eq 1
  end
  
  it 'should have a valid factory' do
    expect(create(:order_detail)).to be_valid
  end

  describe 'validation' do
    it do
      should validate_numericality_of(:quantity)
        .only_integer.is_greater_than(0)
    end
  end
  
  describe 'associations' do
    it { should belong_to(:order) }
    it { should belong_to(:menu_item) }
  end

  it 'should save the price of menu item' do
    order_detail = create(:order_detail)

    expect(order_detail.price).to eq order_detail.menu_item.price
  end
end
