Rails.application.routes.draw do
  get "/about" => "homes#about", as: 'about'

  # 店側のルーティング
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    paswords: 'admins/paswords',
  }

  namespace :admin do
    get 'homes/top' => 'homes#top', as: 'top'
    resources :homes, only: [:top] do
      collection do
        get 'search'
      end
    end
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    post 'customers/search'
    resources :products, only: [:index, :show, :create, :update, :edit, :new]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    root to: "homes#top"
    resource :customers, except: [:create]

    get '/orders/thanks' => "orders#thanks"
    post '/orders/confirm' => "orders#confirm"
    delete '/cart_products/destroy_all' => "cart_products#destroy_all"
    patch '/customers/withdraw' => "customers#withdraw"
    get '/customers/unsubscribe' => "customers#unsubscribe"
    resources :cart_products, only: [:index, :update, :destroy, :create]
    resources :products, only: [:index, :show, :create]
    resources :orders, only: [:index, :show, :new, :create]
    resources :deliveries, only: [:index, :edit, :update, :create, :destroy]

  end
 # 顧客のルーティング
   devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    paswords: 'customers/paswords',
    registrations: 'customers/registrations',

  }
end
