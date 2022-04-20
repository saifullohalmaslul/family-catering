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
end
