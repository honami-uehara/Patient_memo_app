# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/index', to: 'users/registrations#index'
    get 'users/destroy', to: 'users/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  get 'home/about'

  resource :account, only: %i[show edit update] do
    member do
      get :bookmarks
    end
  end

  resources :patients do
    resource :bookmarks, only: %i[create destroy]
    resources :additional_comments, only: %i[create destroy]

    collection do
      get :search
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
