Rails.application.routes.draw do
  resources :itens
  resources :pedidos
  resources :avaliacoes
  resources :produtos
  resources :sub_categorias
  resources :categorias
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
end
