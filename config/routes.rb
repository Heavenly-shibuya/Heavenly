Rails.application.routes.draw do
  namespace :admin do
    get 'orders/index'
  end
  namespace :admin do
    get 'items/show'
    get 'items/edit'
    get 'items/new'
    get 'items/stock'
    get 'items/stock_edit'
  end
  namespace :admin do
    get 'delivery_addresss/new'
    get 'delivery_addresss/create'
    get 'delivery_addresss/edit'
  end
  namespace :admin do
    get 'messages/index'
    get 'messages/show'
    get 'messages/new'
  end
  namespace :admin do
    get 'reviews/index'
    get 'reviews/show'
    get 'reviews/new'
  end
  namespace :admin do
    get 'order_items/index'
    get 'order_items/show'
    get 'order_items/new'
  end
  namespace :admin do
    get 'carts_items/index'
    get 'carts_items/edit'
  end
  namespace :admin do
    get 'favorites/index'
  end
  namespace :admin do
    get 'news_posts/index'
    get 'news_posts/show'
    get 'news_posts/edit'
    get 'news_posts/new'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/show'
    get 'genres/edit'
    get 'genres/new'
  end
  namespace :admin do
    get 'artists/index'
    get 'artists/show'
    get 'artists/edit'
  end
  get 'admins/index'
  get 'admins/show'
  get 'admins/edit'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'items/stock'
  get 'items/stock_edit'

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
  resources :users
  end

  resources :genres
  resources :artists
  resources :news_posts
  resources :items

  resources :messages
  resources :users
  resources :admins

  resources :order_items
  resources :favorites, :only => [:index]
  resources :delivery_addresss
  resources :reviews, :only => [:index, :show]
  resources :carts_items, :only => [:index, :edit]



end
