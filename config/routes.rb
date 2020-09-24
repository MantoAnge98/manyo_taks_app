Rails.application.routes.draw do
  get 'users/index'
  root to: 'tasks#index'
  resources :tasks do
    collection do
      post :confirm
    end
  end
end
