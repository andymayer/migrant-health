Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'

  resources :resources
  namespace :resources do
    resources :how_tos
    resources :fact_sheets
  end

  get '/search/', to: 'search#index', as: 'search'
end
