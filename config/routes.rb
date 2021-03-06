Rails.application.routes.draw do
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only:[:index,:new,:show,:create,:edit,:update,:destroy]

  root to: "public#homepage"
  
  resources :tasks do
    collection do
      post :confirm
    end
  end

  namespace :admin do
    resources :users do
      collection do
        post :confirm
      end
    end
  end
end
 