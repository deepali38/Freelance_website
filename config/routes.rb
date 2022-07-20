Rails.application.routes.draw do
  
  resources :profiles
  get 'rooms/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to:"post#index"
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
  get "attachments/:id/purge", to: "attachments#purge"
  delete "attachments/:id/purge", to: "attachments#purge", as: "purge_attachment"
  resources :categories
  resources :jobs do
    resources :bids
  end
  get "jobs_board", to:"jobs_board#index"
  get "portfolio", to:"portfolios#index"
  resources :rooms
  resources :users
  resources :rooms do
    resources :messages
  end
  get "bids", to:"jobs#bid_show"
  get "view", to:"profiles#view"
 

end 
                  