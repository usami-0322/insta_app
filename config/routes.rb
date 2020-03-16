Rails.application.routes.draw do

  devise_for :users, controllers: { 
      :sessions      => "users/sessions",
      :registrations => "users/registrations",
      :passwords     => "users/passwords",
      omniauth_callbacks: 'users/omniauth_callbacks'
      }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root 'home#top'
  get '/about', to: 'home#about'
  get '/policy', to: 'home#policy'
  resources :users, only: [:index, :show, :update]
  resources :microposts, only: [:create, :destroy]
end