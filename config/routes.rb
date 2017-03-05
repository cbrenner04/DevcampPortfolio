# frozen_string_literal: true
Rails.application.routes.draw do
  resources :pages, only: [] do
    get :home, on: :collection
    get :about, on: :collection
    get :contact, on: :collection
  end

  resources :blogs
end
