Rails.application.routes.draw do

  devise_for :users
  resources :line_items
  resources :carts
  resources :order_items

  root to: 'pages#home'
  get '/login', to: "admin/sessions#new"
  get '/logout', to: "admin/sessions#destroy"

  
  

  namespace :admin do
    resources :products do 
      member do 
        get :toggle_status
      end
    end
    resources :dashboards, only: [:index]
    resources :traivans, only: [:index ,:edit, :update]
    resources :sessions, only: [:new ,:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
