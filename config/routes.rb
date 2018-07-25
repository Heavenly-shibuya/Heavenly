Rails.application.routes.draw do

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
  resources :users, :genres, :artists, :news_posts, :order_items, :reviews, :messages, :delivery_addresss, :items
  resources :favorites, :only => [:index]
  resources :carts_items, :only => [:index, :edit]
  resources :orders, :only => [:index]
  resources :order_items, :only => [:index, :show]
  end

  resources :genres
  resources :artists
  resources :news_posts
  resources :items do
    resources :carts_items
  end

  resources :messages
  resources :users
  resources :admins

  resources :order_items
  resources :favorites, :only => [:index]
  resources :delivery_addresses
  resources :reviews, :only => [:index, :show]
  resources :carts, :only => [:index, :show, :edit, :destroy]



end
