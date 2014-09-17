Rails.application.routes.draw do
  root :to => "users#new"

  resources :sessions
  resources :users

end
