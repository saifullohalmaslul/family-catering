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
        @order.menu_items << menu_item
        OrderDetail.find_by(order: @order, menu_item: menu_item)
          .update(price: menu_item.price, quantity: quantity)
        total_price += menu_item.price * quantity
      end

      @order.total_price = total_price
    end
  end
end
