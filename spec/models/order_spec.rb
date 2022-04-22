require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'should have a valid factory' do
    expect(build(:order)).to be_valid
  end

  it 'should have an invalid factory' do
    expect(build(:invalid_order)).to be_invalid
  end

  it { should accept_nested_attributes_for(:order_details) }
  
  describe 'validations' do
    it { should validate_inclusion_of(:status).in_array(['NEW', 'PAID', 'CANCELED']) }

    it 'should have a valid email format' do
      order = build(:order, email: 'halo@example')
      order.valid?
      expect(order.errors[:email]).to include('is not an email')
    end

    it 'should have default NEW for status' do
      order = Order.new
      expect(order.status).to eq('NEW')
    end
  end

  describe 'associations' do
    it { should have_many(:order_details) }
    it { should have_many(:menu_items) }
  end

  it 'should save the total price of purchase' do
    order = create(:order)
    menu_item_1 = build(:menu_item, price: 10_000)
    menu_item_2 = build(:menu_item, price: 15_000)
    order_details = [
      build(:order_detail, menu_item: menu_item_1, quantity: 2),
      build(:order_detail, menu_item: menu_item_2, quantity: 1)
    ]

    order.order_details = order_details
    order.save

    expect(order.total_price).to eq 35_000
  end
end
