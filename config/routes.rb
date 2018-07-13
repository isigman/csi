Rails.application.routes.draw do

  get 'dashboard/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'pages/index'

  devise_for :users

  root to: "pages#index"
  get '/services', to: 'pages#services'
  get '/research_center', to: 'pages#research_center'
  get '/events', to: 'pages#events'
  get '/client_area', to: 'pages#client_area'
  get '/about', to: 'pages#about'
  get '/portal', to: 'pages#portal'
  get '/contact', to: 'pages#contact'

  post '/research_center', to: 'pages#search_results'
  get '/article/{id}', to: 'pages#article'
  get '/map', to: 'pages#map'
  get '/conference_2018', to: 'pages#conference_2018'
  get '/tax_rating_billing_solutions', to: 'pages#trbs'

  get '/under_construction', to: 'pages#under_construction'

  #client portal routes
  get '/dashboard', to: 'dashboard#show'
  get '/dashboard/search/results', to: 'dashboard#results'
  get '/dashboard/search', to: 'dashboard#search_index'
  post '/dashboard/search', to: 'dashboard#search'
  get '/dashboard/upload', to: 'dashboard#upload_index'
  post '/dashboard/upload', to: 'dashboard#upload'

end
