Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update]
  # get "/users", to: "users#index", as: "users"
  # post "/users", to: "users#create"
  # get "/users/new", to: "users#new", as: "new_user"
  # get "/users/:id/edit", to: "users#edit", as: "edit_user"
  # get "/users/:id", to: "users#show", as: "user"
  # patch "/users/:id", to: "user#update"
  # put "/users/:id", to: "user#update"
  # delete "/users/:id", to: "user#destroy"

  resources :artwork_shares, only: [:create, :destroy]
end
