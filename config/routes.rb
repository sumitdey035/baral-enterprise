# frozen_string_literal: true

Rails.application.routes.draw do
  resources :dashboard, only: :index
  resources :customers, except: :destroy do
    resources :addresses, except: %i[index show destroy]
    resources :service_requests, except: %i[index destroy]
  end

  root 'dashboard#index'
end
