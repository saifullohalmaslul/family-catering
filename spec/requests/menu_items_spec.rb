require 'rails_helper'

RSpec.describe MenuItemsController, type: :controller do
  describe 'GET #index' do
    it "populates an array of all menu_items"
    it "renders the :index template"
  end

  describe 'GET #show' do
    it "assigns the requested menu_item to @menu_item" do
      menu_item = create(:menu_item_with_categories)
      get :show, params: { id: menu_item }
      expect(assigns(:menu_item)).to eq menu_item
    end
    
    it "renders the :show template" do
      menu_item = create(:menu_item_with_categories)
      get :show, params: { id: menu_item }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new menu_item to @menu_item"
    it "renders the :new template"
  end

  describe 'GET #edit' do
    it "assigns the requested menu_item to @menu_item"
    it "renders the :edit template"
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new menu_item in the database"
      it "redirects to menu_items#show"
    end

    context "with invalid attributes" do
      it "does not save the new menu_item in the database"
      it "re-renders the :new template"
    end
  end

  describe 'PATCH #update' do
    context "with valid attributes" do
      it "locates the requested @menu_item"
      it "changes @menu_item's attributes"
      it "redirects to the menu_item"
    end

    context 'with invalid attributes' do
      it 'does not save the updated menu_item in the database'
      it 're-renders the edit template'
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the menu_item from the database"
    it "redirects to menu_items#index"
  end
end
