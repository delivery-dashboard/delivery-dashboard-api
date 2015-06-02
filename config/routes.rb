Rails.application.routes.draw do
  root 'application#home'
  namespace :api do
    resources :periods, only: [:index, :create, :destroy] do
      resources :reports, only: [:index, :create, :update]
    end
    resources :projects, only: [:index, :show]
  end
end