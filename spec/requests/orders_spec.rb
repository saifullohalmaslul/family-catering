require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before do
    @order_requirements = {
      order: attributes_for(:order), 
      details: [
        { menu_item: create(:menu_item_with_categories, price: 12_000), quantity: 1 },
        { menu_item: create(:menu_item_with_categories, price: 10_000), quantity: 3 }
      ]
    }
  end
  
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
      post :create, params: @order_requirements
      expect(response).to render_template :new
    end
    
    context "with valid attributes" do
      it "saves the new order in the database" do
        expect{
          post :create, params: @order_requirements
        }.to change(Order, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not saves the new order in the database" do
        @order_requirements[:order] = attributes_for(:invalid_order)
        
        expect{
          post :create, params: @order_requirements
        }.not_to change(Order, :count)
      end
    end
  end

  describe 'PATCH #update' do
    let(:order) { create(:order_with_menu_items) }
    
    context "with valid attributes" do
      it "locates the requested @order" do
        @order_requirements[:id] = order
        patch :update, params: @order_requirements
        
        expect(assigns(:order)).to eq order
      end

      it "changes the @order's attribute" do
        @order_requirements[:id] = order
        @order_requirements[:order][:status] = 'PAID'
        
        patch :update, params: @order_requirements
        
        expect(assigns(:order).status).to eq 'PAID'
      end
    end
  end
end
