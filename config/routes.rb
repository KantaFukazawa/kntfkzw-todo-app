Rails.application.routes.draw do
  
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "boards#index"
  resource :profile, only: [:show, :edit, :update]
  resources :boards, only: [:index, :new, :create, :edit, :update, :destroy] 
  resources :tasks, only: [:index, :show, :new, :create, :edit, :update, :destroy] 

  resources :tasks do
    resources :comments, only:[:new, :create]
  end
end