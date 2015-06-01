Rails.application.routes.draw do
  namespace :api do
    resources :periods, only: [:index, :create, :destroy] do
      resources :statuses, only: [:index, :create, :update]
    end
    resources :projects, only: [:index, :show]
  end
end