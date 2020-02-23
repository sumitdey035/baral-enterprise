# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :dashboard, only: :index do
    get :sms_balance, on: :collection
  end
  resources :customers, except: :destroy do
    resources :addresses, except: %i[index show destroy]
    resources :service_requests, except: %i[index destroy]
  end

  root 'dashboard#index'
end
