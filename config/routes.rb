Rails.application.routes.draw do
  
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :sessions, only: [:new, :create, :show, :destroy]
  root to: "public#homepage"
  resources :tasks do
    collection do
      post :confirm
    end
  end
end
