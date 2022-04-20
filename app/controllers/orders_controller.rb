class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end
end
