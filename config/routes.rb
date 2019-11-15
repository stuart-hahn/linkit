Rails.application.routes.draw do
  get 'callbacks/github'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  root to: "links#index"
  
  resources :links
  resources :categories do
    resources :links, shallow: true
  end

end
