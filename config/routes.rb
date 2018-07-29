Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  get 'carts/index'
  get 'carts/show'
  get 'admins/index'
  get 'admins/show'
  get 'admins/edit'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'items/search'

  delete 'users/:id/edit/destroy' => 'users#destroy', as: 'destroy_users'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admin do
    resources :users, :genres, :artists, :news_posts, :reviews, :delivery_addresss, :items
    resources :favorites, :only => [:index]
    resources :carts_items, :only => [:index, :edit]
    resources :orders, :only => [:index, :edit, :show, :destroy]
  end

  resources :genres
  resources :artists
  resources :news_posts, only: [:index, :show, :update]
  resources :items do
    resources :carts_items
    resource :reviews, only: [:create, :destroy]
  end

  resources :users
  resources :admins
  resources :orders, :only => [:index, :update, :show, :new, :create]
  get 'order/buy', to: 'orders#buy', as: 'buy_order'
  resources :favorites, :only => [:index]
  resources :delivery_addresses
  resources :reviews, :only => [:index, :show]
  resources :carts, :only => [:index, :show, :edit, :destroy]
  get'genre/1'


end
