Rails.application.routes.draw do
  resources :dashboard, only: :index
  resources :customers do
    resources :addresses, except: :index
    resources :service_requests
  end

  root 'dashboard#index'
end
