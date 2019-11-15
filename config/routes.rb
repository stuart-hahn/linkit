Rails.application.routes.draw do
  get 'callbacks/github'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  root to: "links#index"
  resources :links
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end