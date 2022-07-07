Rails.application.routes.draw do
  root 'home#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/index', to: 'users/registrations#index'
    get 'users/destroy', to: 'users/sessions#destroy'
  end

  get 'home/about'

  resource :account, only: [:show, :edit, :update] do
    member do
      get :bookmarks
    end
  end

  resources :patient_registrations do
    resource :bookmarks, only: [:create, :destroy]
    resources :additional_comments, only: [:create, :destroy]

    collection do
      get :search
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
