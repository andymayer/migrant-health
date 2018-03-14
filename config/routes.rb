Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}

  root 'static_pages#home'

  get 'users/:id', to: 'users#show',  as: :user_profile
  get 'users',     to: 'users#index', as: :users

  resources :resources, only: :index

  namespace :resources do
    resources :how_tos
    resources :fact_sheets
    resources :bright_ideas
    resources :tools
    resources :countries
  end

  resources :votes
  resources :comments

  resources :answers do
    member do
      get 'like',   to: "answers#like"
      get 'unlike', to: "answers#unlike"
    end
  end

  resources :questions do
    member do
      get 'like',   to: "questions#like"
      get 'unlike', to: "questions#unlike"
    end
  end

  resources :questions

  resources :topics

  get '/topics/:id', to: 'topics#show', as: :acts_as_taggable_on_tag
  get '/topics', to: 'topics#new', as: :acts_as_taggable_on_tags


  get '/search/', to: 'search#index', as: :search

  # Static pages
  get '/about/',          to: 'static_pages#about',           as: :about
  get '/accessibility/',  to: 'static_pages#accessibility',   as: :accessibility
  get '/privacy-policy/', to: 'static_pages#privacy_policy',  as: :privacy_policy
  get '/contact-us/',     to: 'static_pages#contact_us',      as: :contact_us

  # Catch all for 404
  get "*any", via: :all, to: "errors#not_found"
end
