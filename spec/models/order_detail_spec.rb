require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  it 'should have a valid factory' do
    expect(create(:order_detail)).to be_valid
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
