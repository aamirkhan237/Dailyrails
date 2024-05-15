Rails.application.routes.draw do 

  resource :cart, only: [:show] do
    resources :cart_items, only: [:create, :update, :destroy]
  end

  # get '/display/', to: 'products#show_custom', as: 'display_product'

  resources :orders, only: [:create, :new]
  resources :addresses, only: [:new, :create]
  

  
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
  
 
  
  resources :users do
    member do
      post 'follow', to: 'users#follow'
      post 'unfollow', to: 'users#unfollow'
    end
  end
get '/pages/:slug', to: 'cms_pages#show', as: 'cms_page'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
 
  # Defines the root path route ("/")
  root "pages#home"
end
