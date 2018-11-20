Rails.application.routes.draw do
  resources :itens
  resources :pedidos
  resources :avaliacoes
  resources :produtos
  resources :sub_categorias
  resources :categorias
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  get "/console", to: "pages#console", as: "console"
  get "/categoria/:categoria", to: "pages#categoria", as: "categoria"
  get "/sub_categoria/:sub_categoria", to: "pages#sub_categoria", as: "sub_categoria"

  root to: "pages#home"
end
