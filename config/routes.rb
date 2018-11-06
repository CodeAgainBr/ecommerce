Rails.application.routes.draw do
  resources :produtos
  resources :sub_categorias
  resources :categorias
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  get "/console", to: "pages#console", as: "console"

  root to: "pages#home"
end
