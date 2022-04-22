require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before do
    @order_requirements = {
      attributes: attributes_for(:order), 
      details: [
        { menu_item: create(:menu_item, price: 12_000), quantity: 1 },
        { menu_item: create(:menu_item, price: 10_000), quantity: 3 }
      ]
    }
  end

  describe 'GET #index' do
    it "populates an array of all orders" do
      orders = [
        create(:order),
        create(:order),
        create(:order)
      ]

      get :index
      expect(assigns(:orders)).to match_array orders
    end
    
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
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
      order = create(:order)
      get :edit, params: { id: order }
      
      expect(assigns(:order)).to eq order
    end
    
    it "renders the :edit template" do
      order = create(:order)
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
        @order_requirements[:attributes] = attributes_for(:invalid_order)
        
        expect{
          post :create, params: @order_requirements
        }.not_to change(Order, :count)
      end
    end
  end

  describe 'PATCH #update' do
    let(:order) { create(:order) }
    
    context "with valid attributes" do
      it "locates the requested @order" do
        @order_requirements[:id] = order
        patch :update, params: @order_requirements
        
        expect(assigns(:order)).to eq order
      end

      it "changes the @order's attribute" do
        @order_requirements[:id] = order
        @order_requirements[:attributes][:status] = 'PAID'
        
        patch :update, params: @order_requirements
        order.reload
        
        expect(order.status).to eq 'PAID'
      end
    end

    context "with invalid attributes" do
      it "does not change the @order's attribute" do
        @order_requirements[:id] = order
        @order_requirements[:attributes] = attributes_for(:invalid_order)
        
        patch :update, params: @order_requirements
        order.reload
        
        expect(order.status).not_to eq attributes_for(:invalid_order)[:status]
      end
    end
  end
end
