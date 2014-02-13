Coinapp::Application.routes.draw do
    get 'partials/*partial' => 'partials#partial'

    get '/*path', to: 'dashboards#index_template'

    match 'login', to: 'user_sessions#new', :via => [:get, :post]
    match 'logout', to: 'user_sessions#destroy', :via => [:get, :post]

    resources :user_sessions
    resources :users

    root to: 'dashboards#index_template'
end
