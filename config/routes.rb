Rails.application.routes.draw do 
  get 'profile/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :courses
  devise_for :users , controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts  
  resources :products
  
  # get 'user/:id', to:'user', as:'user'
  # post 'user/:id/follow', to: 'users#follow', as: 'follow'
  # post 'user/:id/unfollow', to: 'users#unfollow', as: 'unfollow'
  
  resources :users, only: [] do
    member do
      post 'follow', to: 'users#follow'
      post 'unfollow', to: 'users#unfollow'
    end
  end
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
 
  # Defines the root path route ("/")
  root "pages#home"
end
