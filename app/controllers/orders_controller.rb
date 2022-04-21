class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params.require(:order).permit(:email))

    if @order.save
      total_price = 0
      
      params[:details].each do |detail|
        menu_item = MenuItem.find(detail[:menu_item])
        quantity = detail[:quantity].to_f
        
        fill_order_detail(@order, menu_item, quantity)
      end

      fill_total_price(@order)
    end
    
    render :new
  end

  def update
    @order = Order.find(params[:id])
  end

  private

  def fill_order_detail(order, menu_item, quantity)
    OrderDetail.create(
      order: order, 
      menu_item: menu_item, 
      price: menu_item.price, 
      quantity: quantity
    )
  end

  def fill_total_price(order)
    total_price = 0
    
    order.order_details.each do |one_item| 
      total_price += one_item.price * one_item.quantity
    end

    order.total_price = total_price
  end
end
