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
    order = create(:order_with_menu_items)

    total_price = order.order_details.sum do |order_detail| 
      order_detail.price * order_detail.quantity 
    end

    expect(order.total_price).to eq total_price
  end
end
