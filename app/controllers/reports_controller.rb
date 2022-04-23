class ReportsController < ApplicationController
  def index
    if params[:date]
      @orders = Order.where(status: 'PAID', created_at: params[:date].to_date.all_day)
      @date = params[:date]
    else
      @orders = Order.where(status: 'PAID', created_at: Date.today.all_day)
    end
  end
end
