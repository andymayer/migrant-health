Rails.application.routes.draw do


  devise_for :users
  root 'static_pages#home'

  resources :resources, only: :index

  namespace :resources do
    resources :how_tos
    resources :fact_sheets
    resources :practice_examples
    resources :tools
  end

  get '/search/', to: 'search#index', as: 'search'
end
