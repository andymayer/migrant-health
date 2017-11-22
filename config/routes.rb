Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'

  get 'users/:id', to: 'users#show', as: :user_profile

  resources :resources, only: :index

  namespace :resources do
    resources :how_tos
    resources :fact_sheets
    resources :practice_examples
    resources :tools
    resources :countries
  end

  resources :votes
  resources :comments

  resources :answers do
    member do
      put 'like',   to: "answers#like"
      put 'unlike', to: "answers#unlike"
    end
  end

  resources :questions

  resources :topics, only: [:index, :show]

  get '/topics/:id', to: 'topics#show', as: :acts_as_taggable_on_tag

  get '/search/', to: 'search#index', as: :search

  # Static pages
  get '/about/',          to: 'static_pages#about',           as: :about
  get '/accessibility/',  to: 'static_pages#accessibility',   as: :accessibility
  get '/privacy-policy/', to: 'static_pages#privacy_policy',  as: :privacy_policy
  get '/contact-us/',     to: 'static_pages#contact_us',      as: :contact_us

  # Catch all for 404
  get "*any", via: :all, to: "errors#not_found"
end
