Coinapp::Application.routes.draw do

    match 'login', to: 'user_sessions#create', :via => [:get, :post]
    match 'logout', to: 'user_sessions#destroy', :via => [:get, :post]

    resources :user_sessions, only: [:create, :destroy]
    resources :users, only: [:show, :create]
    resources :schedules, only: [:index, :create, :destroy] do
      member do
        post 'disable', to: 'schedules#disable'
        post 'enable', to: 'schedules#enable'
      end
    end

    get 'partials/*partial' => 'partials#partial'

    get '/*path', to: 'home#index_template'

    root to: 'home#index_template'
end
