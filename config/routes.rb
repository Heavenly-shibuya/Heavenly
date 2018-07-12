Rails.application.routes.draw do
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
  resources :news_posts, :only => [:index, :show, :edit, :new]

end
