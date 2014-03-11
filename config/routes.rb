require 'sidekiq/web'

Coinapp::Application.routes.draw do
  mount Sidekiq::Web, at: "/sidekiq"

  match 'login', to: 'user_sessions#create', :via => [:get, :post]
  match 'logout', to: 'user_sessions#destroy', :via => [:get, :post]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:show, :create]
      resources :schedules, only: [:index, :create, :destroy] do
        member do
          post 'disable', to: 'schedules#disable'
          post 'enable', to: 'schedules#enable'
        end
      end
    end
  end

  # Login/Logout
  resources :user_sessions, only: [:create, :destroy]

  root to: 'home#index_template'
  get 'partials/*partial' => 'partials#partial'
  get '/*path', to: 'home#index_template'

end
