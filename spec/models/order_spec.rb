require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'should have a valid factory' do
    expect(build(:order_with_menu_items)).to be_valid
  end
  
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
end
