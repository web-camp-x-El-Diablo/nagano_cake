Rails.application.routes.draw do
  root to: "homes#top"
  get "/about" => "homes#about", as: 'about'

  # 店側のルーティング
  devise_for :admins, skip: :all
  devise_scope :admin do
    get '/admin/sign_in' => "admin/sessions#new", as: :new_admin_session
    post '/admin/sign_in' => "admin/sessions#create", as: :admin_session
    delete '/admin/sign_out' => "admin/sessions#destroy",as: :destroy_admin_session
  end

  namespace :admin do
    get 'homes/top' => 'homes#top', as: 'top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, only: [:index, :show, :create, :update, :edit, :new]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  # 顧客のルーティング
  devise_for :customers
  get '/orders/thanks' => "orders#thanks"
  post '/orders/confirm' => "orders#confirm"
  delete '/cart_products/destroy_all' => "cart_products#destroy_all"
  patch '/customers/withdraw' => "customers#withdraw"
  get '/customers/unsubscribe' => "customers#unsubscribe"

  resource :customers, only: [:edit, :update, :show]
  resources :products, only: [:index, :show]
  resources :cart_products, only: [:index, :update, :destroy, :create]
  resources :orders, only: [:index, :show, :new, :create]
  resources :deliveries, only: [:index, :edit, :update, :create, :destroy]

end
