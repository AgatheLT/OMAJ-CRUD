Rails.application.routes.draw do
  resources :categories do 
    resources :products, only: [ :index, :new, :create ]
  end
  resources :products, only: [ :show, :edit, :update, :destroy ]
  root 'categories#index'
end

