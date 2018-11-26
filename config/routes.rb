Rails.application.routes.draw do
  resources :pedidos

  resources :itens
  
  resources :avaliacoes
  resources :produtos
  resources :sub_categorias
  resources :categorias
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  get "/console", to: "pages#console", as: "console"
  get "/add_carrinho/:id", to: "pages#add_carrinho", as: "home_add_carrinho"
  get "/home/categoria/:categoria", to: "pages#categoria", as: "home_categoria"
  get "/home/sub_categoria/:sub_categoria", to: "pages#sub_categoria", as: "home_sub_categoria"



  root to: "pages#home"
end
