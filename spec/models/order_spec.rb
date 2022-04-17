require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    it { should validate_inclusion_of(:status).in_array(['NEW', 'PAID', 'CANCELED']) }
  end

  describe 'associations' do
    it { should have_many(:order_details) }
  end
end
