Rails.application.routes.draw do
  root to: "public#homepage"
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :sessions, only: [:new, :create, :show, :destroy]
  get 'session/new'
  root to: 'tasks#index'
  resources :tasks do
    collection do
      post :confirm
    end
  end
end
