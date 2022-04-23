require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  include ActiveSupport::Testing::TimeHelpers
  
  describe "GET #index" do
    context 'with no params' do
      it 'populates array of paid orders of current day' do
        orders_yesterday = [
          create(:order),
          create(:order),
          create(:order)
        ]

        travel 1.day

        orders_today = [
          create(:order, status: 'PAID'),
          create(:order),
          create(:order, status: 'PAID')
        ]

        get :index
        expect(assigns(:orders)).to match_array [orders_today[0], orders_today[2]]
      end
    end

    context 'with date param' do
      it 'populates array of paid orders of the specified day' do
        orders_yesterday = [
          create(:order, status: 'PAID'),
          create(:order, status: 'PAID'),
          create(:order)
        ]

        travel 1.day

        orders_today = [
          create(:order, status: 'PAID'),
          create(:order),
          create(:order, status: 'PAID')
        ]

        get :index, params: { date: Date.yesterday }
        expect(assigns(:orders)).to match_array [orders_yesterday[0], orders_yesterday[1]]
      end
    end
  end
end
