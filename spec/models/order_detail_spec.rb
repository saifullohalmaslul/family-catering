require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  describe 'association' do
    it { should belong_to(:order) }
  end
end
