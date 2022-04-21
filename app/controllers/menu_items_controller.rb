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

  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  def create
    @menu_item = MenuItem.new(params.require(:attributes).permit(:name, :description, :price))

    params[:category_names].each do |category_name|
      @menu_item.categories << Category.find_or_create_by(name: category_name)
    end

    if @menu_item.save
      redirect_to @menu_item
    else
      render :new
    end
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    if @menu_item.update(params.require(:attributes).permit(:name, :description, :price))
      redirect_to @menu_item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy

    redirect_to menu_items_url
  end
end
