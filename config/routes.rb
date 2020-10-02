Rails.application.routes.draw do
  
  get 'errors/internal_error'
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

  #routes to errors
  get '404', :to => 'errors#not_found'
  get '500', :to => 'errors#internal_error'

end
 