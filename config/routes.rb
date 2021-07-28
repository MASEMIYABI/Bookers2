Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books,only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:new,:index,:show,:edit, :update]

  get 'home/about' =>  'homes#home'
end
