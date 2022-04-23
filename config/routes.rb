Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  get '/reports', to: 'reports#index', as: 'reports'
  resources :menu_items
  resources :orders, only: [:index, :new, :edit, :create, :update, :destroy]
end
