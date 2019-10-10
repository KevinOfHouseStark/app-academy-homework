Rails.application.routes.draw do
  
  resources :users

  resources :subs, except: [:destroy] do
    resources :posts, only: [:new, :create]
  end

  resources :posts, except: [:new, :create] do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:create, :show]
  
  resource :session, only: [:new, :create, :destroy]
end
