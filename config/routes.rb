# frozen_string_literal: true
Rails.application.routes.draw do
  resources :comments
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               sign_up: 'register'
             }

  resources :whatevers
  resources :blogs do
    get :toggle_status, on: :member
  end

  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end

  get :about, to: 'pages#about'
  get :contact, to: 'pages#contact'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'tweets', to: 'pages#tweets'

  root to: 'pages#home'
end
