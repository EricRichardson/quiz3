Rails.application.routes.draw do

  root 'users#new'
  resources :users
  resources :sessions, only: [:new, :create, :destroy] do
    delete :destroy, on: :collection
  end

end
