Rails.application.routes.draw do
  resources :categories do
    resources :products, only: [:index, :new, :create]
  end
  resources :products
  root 'categories#index'
end
