class OrdersController < ApplicationController
  def index
    @orders = Order.order(created_at: :desc)
  end
  
  def new
    @order = Order.new
    4.times { @order.order_details.build }
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to orders_url
    else
      render :new
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to orders_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_url
  end

  private

  def order_params
    params.require(:order).permit(:status, :email, order_details_attributes: [ :id, :menu_item_id, :quantity, :_destroy ])
  end
end
