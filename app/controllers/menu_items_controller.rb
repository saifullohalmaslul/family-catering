class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all
  end
  
  def show
    @menu_item = MenuItem.find(params[:id])
  end

  def new
    @menu_item = MenuItem.new
  end
end
