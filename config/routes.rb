Coinapp::Application.routes.draw do
    get 'partials/*partial' => 'partials#partial'

    get '/*path', to: 'dashboards#index_template'

    root to: 'dashboards#index_template'
end
