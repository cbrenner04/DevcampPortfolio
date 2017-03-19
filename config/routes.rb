# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users,
             path: "",
             path_names: {
               sign_in: "login",
               sign_out: "logout",
               sign_up: "register"
             }

  resource :about, only: :show
  resources :blogs do
    get :toggle_status, on: :member
  end
  resource :contact, only: :show
  resource :home, only: :show
  resources :portfolios do
    put :sort, on: :collection
  end
  resources :topics, only: [:index, :show]
  resources :tweets, only: :index

  mount ActionCable.server => "/cable"

  root to: "homes#show"
end
