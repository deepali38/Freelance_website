Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to:"post#index"
  
  # user sign-up and sign-in
  get "sign_up", to:"registrations#new"
  post 'sign_up', to: 'registrations#create'
  get "edit", to:"registration_edit#edit"
  patch 'edit', to: 'registration_edit#update'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  resources :notices

  # admin + accepting user registration via admin approval
  resources :admin
  resources :admin, only:[] do
    patch :accept
    get :accept
  end

  #categories
  resources :categories

  # Profile page of user
  resources :profiles

  # jobs + nested bids
  resources :jobs do
    resources :bids
  end

  get "attachments/:id/purge", to: "attachments#purge"
  delete "attachments/:id/purge", to: "attachments#purge", as: "purge_attachment"

  # Accepting and rejecting a bid
  resources :bids, only:[] do
    patch :accept
    get :accept
    get :reject
    patch :reject
  end
  
  # jobs_board (all the jobs listed)
  resources :jobs_board

  # portfolios (all the freelancers profiles listed)
  resources :portfolios

  # get "jobs_board", to:"jobs_board#index"
  # get "portfolio", to:"portfolios#index"

  get 'rooms/index'
  resources :rooms
  resources :users
  resources :rooms do
    resources :messages
  end

  get "bids", to:"jobs#bid_show"
  get "files", to:"jobs#upload_show"

  # get "view", to:"profiles#view"
  # get "profiles", to: "profiles#show", as: :user_root_path
end 
                  