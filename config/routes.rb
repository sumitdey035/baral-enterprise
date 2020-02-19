Rails.application.routes.draw do
  resources :dashboard, only: :index
  resources :customers, except: :destroy do
    resources :addresses, except: %i[index show destroy]
    resources :service_requests, except: :destroy
  end

  root 'dashboard#index'
end
