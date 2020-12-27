Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users 
  
    resources :items do
      resources :purchases 
      resources :orders
    end




end
