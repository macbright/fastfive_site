Rails.application.routes.draw do
  
  root 'welcome#index'
  resources :categories
  devise_for :users
  resources :posts
  
  resources :posts do 
    resources :comments
  end
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
