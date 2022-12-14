# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'post#index'

  # user sign-up and sign-in
  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  get 'edit', to: 'users#edit'
  patch 'edit', to: 'users#update'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'passwords#new'
  post 'password/reset', to: 'passwords#create'
  get 'password/reset/edit', to: 'passwords#reset_edit'
  patch 'password/reset/edit', to: 'passwords#reset_update'
  resources :notices

  # admin + accepting user registration via admin approval
  resources :admin
  resources :admin, only: [] do
    patch :accept
    get :accept
  end

  # categories
  resources :categories

  # Profile page of user
  resources :profiles

  # jobs + nested bids
  resources :jobs do
    resources :bids
  end

  # Accepting and rejecting a bid
  resources :bids, only: [] do
    patch :accept
    get :accept
    get :reject
    patch :reject
  end

  #Documents
  resources :documents

  # jobs_board (all the jobs listed)
  resources :jobs_board

  # portfolios (all the freelancers profiles listed)
  resources :portfolios

  # resources :rooms
  resources :rooms do
    resources :messages
  end

  # users
  resources :users, only: %[show]
end
