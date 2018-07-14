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

  resources :genres
  resources :artists
  resources :news_posts
  resources :items
  resources :users
  resources :admins

  resources :order_items
  resources :favorites, :only => [:index]
  resources :delivery_addresss
  resources :news_posts, :only => [:index, :show, :edit, :new]
  resources :reviews, :only => [:index, :show]
  resources :carts_items, :only => [:index, :edit]



end
