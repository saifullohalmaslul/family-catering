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
    @order = Order.new(params.require(:order).permit(:email))

    if @order.save
      redirect_to orders_url
    else
      render :new
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(params.require(:order).permit(:status, :email))
  end
end
