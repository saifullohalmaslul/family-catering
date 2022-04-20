require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'GET #new' do
    it "assigns a new order to @order" do
      get :new
      expect(assigns(:order)).to be_a_new(Order)
    end
    
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested order to @order" do
      order = create(:order_with_menu_items)
      get :edit, params: { id: order }
      expect(assigns(:order)).to eq order
    end
    
    it "renders the :edit template" do
      order = create(:order_with_menu_items)
      get :edit, params: { id: order }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    it "re-renders the :new template" do
      post :create, params: { 
        order: attributes_for(:order), 
        details: [
          { menu_item: create(:menu_item_with_categories, price: 12_000), quantity: 1 },
          { menu_item: create(:menu_item_with_categories, price: 10_000), quantity: 3 }
        ]
      }

      expect(response).to render_template :new
    end
    
    context "with valid attributes" do
      it "saves the new order in the database" do
        expect{
          post :create, params: { 
            order: attributes_for(:order), 
            details: [
              { menu_item: create(:menu_item_with_categories, price: 12_000), quantity: 1 },
              { menu_item: create(:menu_item_with_categories, price: 10_000), quantity: 3 }
            ]
          }
        }.to change(Order, :count).by(1)
      end
    end
  end
end
