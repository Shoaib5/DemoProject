Rails.application.routes.draw do
  root to: 'products#index'
  post 'carts/add_to_cart' ,to: 'carts#add_to_cart', as: 'add_to_cart'
  devise_for :users
  resources :products do
    resources:comments, except: [:index,:show]

  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
