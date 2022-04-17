require 'rails_helper'

RSpec.describe MenuCategory, type: :model do
  describe 'associations' do
    it { should belong_to(:menu_item) }
    it { should belong_to(:category) }
  end
end
