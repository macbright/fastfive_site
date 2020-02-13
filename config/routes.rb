Rails.application.routes.draw do
  
  delete "remove_comment/:id" => "comments#destroy", :as => "remove_comment"
 
  resources :categories
  devise_for :users
  resources :posts
  resources :card_types
  resources :cards
  root "welcome#index"
  resources :posts do 
    resources :comments
  end
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
