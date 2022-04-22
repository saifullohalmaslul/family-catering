require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before do
    @order_attributes = {
      order: attributes_for(:order).merge({
        order_details: [
          { menu_id: create(:menu_item) },
          { menu_id: create(:menu_item) },
          { menu_id: create(:menu_item) }
        ]
      })
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
    
    context "with valid attributes" do
      it "saves the new order in the database" do
        expect{
          post :create, params: @order_attributes
        }.to change(Order, :count).by(1)
      end

      it "redirects to orders#index" do
        post :create, params: @order_attributes
        expect(response).to redirect_to orders_url
      end
    end

    context "with invalid attributes" do
      before { @order_attributes[:order] = attributes_for(:invalid_order) }
      
      it "does not saves the new order in the database" do
        expect{
          post :create, params: @order_attributes
        }.not_to change(Order, :count)
      end
      
      it "re-renders the :new template" do
        post :create, params: @order_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    let(:order) { create(:order) }
    
    context "with valid attributes" do
      it "locates the requested @order" do
        @order_attributes[:id] = order
        patch :update, params: @order_attributes
        
        expect(assigns(:order)).to eq order
      end

      it "changes the @order's attribute" do
        @order_attributes[:id] = order
        @order_attributes[:order][:status] = 'PAID'
        
        patch :update, params: @order_attributes
        order.reload
        
        expect(order.status).to eq 'PAID'
      end

      it "redirects to orders#index" do
        @order_attributes[:id] = order
        patch :update, params: @order_attributes
        
        expect(response).to redirect_to orders_url
      end
    end

    context "with invalid attributes" do
      it "does not change the @order's attribute" do
        @order_attributes[:id] = order
        @order_attributes[:order] = attributes_for(:invalid_order)
        
        patch :update, params: @order_attributes
        order.reload
        
        expect(order.status).not_to eq attributes_for(:invalid_order)[:status]
      end

      it "re-renders the :edit template" do
        @order_attributes[:id] = order
        @order_attributes[:order] = attributes_for(:invalid_order)
        
        patch :update, params: @order_attributes
        expect(response).to render_template :edit
      end
    end
  end
end
