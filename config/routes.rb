Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root "admin#index", as: :authenticated_root
  end

  # get 'admin' => 'admin#index'

  # controller :sessions do
  #   get 'login' => :new
  #   post 'login' => :create
  #   delete 'logout' => :destroy
  # end

  resources :users
  resources :products do
    get :who_bought, on: :member
  end

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
