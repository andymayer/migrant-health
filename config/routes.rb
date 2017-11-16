Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'


  resources :resources, only: :index

  namespace :resources do
    resources :how_tos
    resources :fact_sheets
    resources :practice_examples
    resources :tools
    resources :countries
  end

  resources :topics, only: [:index, :show]

  get '/search/', to: 'search#index', as: :search

  # Static pages
  get '/about/',          to: 'static_pages#about',           as: :about
  get '/accessibility/',  to: 'static_pages#accessibility',   as: :accessibility
  get '/privacy-policy/', to: 'static_pages#privacy_policy',  as: :privacy_policy
  get '/contact-us/',     to: 'static_pages#contact_us',      as: :contact_us

  # Catch all for 404
  get "*any", via: :all, to: "errors#not_found"
end
