class ReportsController < ApplicationController
  def index
    @orders = Order.where(status: 'PAID', created_at: Date.today.all_day)
  end
end
