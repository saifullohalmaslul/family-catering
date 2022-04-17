require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    it { should validate_inclusion_of(:status).in_array(['NEW', 'PAID', 'CANCELED']) }
  end
end
