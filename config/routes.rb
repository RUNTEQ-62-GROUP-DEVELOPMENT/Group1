# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}

  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'posts#index'
  resources :posts, only: %i[new create show] do
    resources :episodes, only: %i[create edit destroy], shallow: true
  end
end
