class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params.require(:attributes).permit(:email))
    @order.save
    
    render :new
  end

  def update
    @order = Order.find(params[:id])
    @order.update(params.require(:attributes).permit(:status, :email))
  end
end
