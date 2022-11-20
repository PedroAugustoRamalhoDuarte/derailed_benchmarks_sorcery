Rails.application.routes.draw do
  root "homepage#index"

  resources :user_sessions, only: [:new, :create, :destroy]
end
