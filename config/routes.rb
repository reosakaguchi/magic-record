Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users
  resources :users do
    member do
      get :follows, :followers
    end
    resource :relationships, only:[:create, :destroy]
  end
  namespace :admin do
    resources :users, only:[:index, :destroy]
  end
  resources :records do
    resources :comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  resources :articles do
    resources :remarks, only:[:create, :destroy]
    collection do
      get 'information'
      get 'learning'
      get 'qanda'
    end
  end
end
