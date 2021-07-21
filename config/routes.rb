Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  get '/search', to: 'searchs#search'

  resources :rooms, only: [:show, :create]
  resources :chats, only: [:create]
  resources :users, only: [:show, :edit, :update] do
    patch :withdrawal, on: :collection
    resource :relationships, only: [:create, :destroy]
  end
  resources :recruitments
  resources :blogs do
    resources :blog_comments, only: [:create, :destroy]
    resource :blog_likes, only: [:create, :destroy]
  end
end
