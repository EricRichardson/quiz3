Rails.application.routes.draw do

  root 'users#new'
  resources :users

  resources :sessions, only: [:new, :create, :destroy] do
    delete :destroy, on: :collection
  end

  resources :ideas do
    resources :likes, only: [:create, :destroy]
    resources :members, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
