Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'welcome/index'
  root 'welcome#index'
  resources :posts
  get '/search', to: 'search#search'
end
