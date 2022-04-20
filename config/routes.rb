Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :menu_items
  get '/orders/new', to: 'orders#new', as: 'new_order'
  get '/orders/:id/edit', to: 'orders#edit', as: 'edit_order'
end
