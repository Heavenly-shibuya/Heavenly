Rails.application.routes.draw do

  get 'admins/index'
  get 'admins/show'
  get 'admins/edit'
  get 'users/index'
  get 'users/show'
  get 'users/edit'

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
  resources :orders, :omly => [:index]
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
  resources :delivery_addresses
  resources :reviews, :only => [:index, :show]
  resources :carts_items, :only => [:index, :edit]



end
