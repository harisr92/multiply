Rails.application.routes.draw do
  devise_for :admins

  root to: "home#index"

  resources :posts
end
