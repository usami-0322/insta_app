Rails.application.routes.draw do

  devise_for :users, controllers: { 
      sessions:           "users/sessions",
      registrations:      "users/registrations",
      passwords:          "users/passwords",
      omniauth_callbacks: "users/omniauth_callbacks"
      }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root 'home#top'
  get '/about', to: 'home#about'
  get '/policy', to: 'home#policy'
 
  resources :users do
    member do
      get :following, :followers, :likes
    end
  end
  resources :microposts,         only: [:new, :index, :show, :create, :destroy]  do
    resources :comments,         only: [:create]
  end
  resources :comments,           only: [:create, :destroy]
  resources :relationships,      only: [:create, :destroy]
  resources :relationship_likes, only: [:create, :destroy]
end