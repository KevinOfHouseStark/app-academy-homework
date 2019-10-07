Rails.application.routes.draw do
  resource :users, only: [:show, :new, :create]

  resource :session, only: [:destroy, :create, :new]
end
