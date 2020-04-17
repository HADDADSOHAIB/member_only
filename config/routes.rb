Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: [:index, :new, :create]
  resources :users, only: [:new, :create]
  get 'login', to: 'session#new'
  delete 'signout', to: 'session#destroy'
  post 'login', to: 'session#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
