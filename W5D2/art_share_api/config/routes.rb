Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  # get "/users", to: "users#index", as: "users"
  # post "/users", to: "users#create"
  # get "/users/new", to: "users#new", as: "new_user"
  # get "/users/:id/edit", to: "users#edit", as: "edit_user"
  # get "/users/:id", to: "users#show", as: "user"
  # patch "/users/:id", to: "user#update"
  # put "/users/:id", to: "user#update"
  # delete "/users/:id", to: "user#destroy"

  resources :artwork_shares, only: [:create, :destroy]

  resources :artworks, only: [:create, :destroy, :show, :update] do
    resources :comments, only: [:index]
  end

  resources :comments, only: [:create, :destroy, :index]
end
