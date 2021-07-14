Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :users, only: [:show, :edit, :update] do
    patch :withdrawal, on: :collection
  end
  resources :recruitments do
    resources :recruit_comments, only: [:create, :destroy]
  end
  resources :blogs do
    resources :blog_comments, only: [:create, :destroy]
    resource :blog_likes, only: [:create, :destroy]
  end
end
