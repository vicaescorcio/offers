# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'offers#index'
  resources :offers, only: %i[index show]
end
