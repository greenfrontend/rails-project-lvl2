# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts do
    scope module: :posts do
      resources :comments, only: [:create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
