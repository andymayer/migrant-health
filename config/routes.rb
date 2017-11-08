Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'

  resources :resources
  resources :how_tos
  resources :fact_sheets

end
